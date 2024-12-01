const std = @import("std");
const stb_tt = @import("stb/stb_truetype.zig");
const sokol = @import("sokol");
const slog = sokol.log;
const sg = sokol.gfx;
const sapp = sokol.app;
const sglue = sokol.glue;

const mat4 = @import("math.zig").Mat4;
const shd_txt = @import("shaders/text.glsl.zig");

const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

// Font atlas
const OVERSAMPLE_X = 2;
const OVERSAMPLE_Y = 2;
const FIRST_CHAR = ' ';
const CHAR_COUNT = '~' - ' '; // number of ascii characters in the atlas
const BITMAP_SIZE = 1024;
const FONT_SIZE = 30.0;

const MAX_LETTERS = 10000; // maximum characters that can be displayed at one time.

const state = struct {
    var pip: sg.Pipeline = .{};
    var bind: sg.Bindings = .{};
    var pass_action: sg.PassAction = .{};

    var vert_buffer: ArrayList(Vertex) = undefined;
    var index_buffer: ArrayList(u16) = undefined;
    var char_info: [CHAR_COUNT]stb_tt.stbtt_packedchar = undefined;
    var tasks: ArrayList(Task) = undefined;

    var ascent: f32 = 0;
    var descent: f32 = 0;
    var line_gap: f32 = 0;
};

// TODO: could be single Vec4 with 2D coords + UV (x,y,u,v).
// z can be inferred as 0.0. color can be a uniform.
const Vertex = extern struct { x: f32, y: f32, z: f32, color: u32, u: f32, v: f32 };

//--------------------------------------------------------------------------------------------------
fn ortho(left: f32, right: f32, bottom: f32, top: f32, znear: f32, zfar: f32) mat4 {
    const l = left;
    const r = right;
    const t = top;
    const b = bottom;
    const f = zfar;
    const n = znear;
    return mat4{
        // zig fmt: off
        .m = [_][4]f32{
            .{ 2.0/(r-l),     0.0,          0.0,            0.0},
            .{ 0.0,           2.0/(t-b),    0.0,            0.0},
            .{ 0.0,           0.0,         -2.0/(f-n),      0.0},
            .{ -(r+l)/(r-l), -(t+b)/(t-b), -(f+n)/(f-n),    1.0}
        },
        // zig fmt: on
    };
}

//--------------------------------------------------------------------------------------------------
fn identity() mat4 {
    return mat4{
        // zig fmt: off
        .m = [_][4]f32{
            .{ 1.0, 0.0, 0.0, 0.0 },
            .{ 0.0, 1.0, 0.0, 0.0 },
            .{ 0.0, 0.0, 1.0, 0.0 },
            .{ 0.0, 0.0, 0.0, 1.0 }
        },
        // zig fmt: on
    };
}

//--------------------------------------------------------------------------------------------------
export fn init() void {
    sg.setup(.{
        .environment = sglue.environment(),
        .logger = .{ .func = slog.func },
    });

    // Font atlas texture for ascii characters
    {
        var ttf_buffer = [_]u8{0} ** (1 << 20);
        var atlas_bitmap = [_]u8{0} ** (BITMAP_SIZE * BITMAP_SIZE);

        const ttf_file = std.fs.cwd().openFile("c:/windows/fonts/times.ttf", .{}) catch |err| {
            std.debug.print("unable to open file: {}\n", .{err});
            return;
        };
        defer ttf_file.close();
        _ = ttf_file.readAll(&ttf_buffer) catch unreachable;

        var context: stb_tt.stbtt_pack_context = undefined;
        if (stb_tt.stbtt_PackBegin(&context, &atlas_bitmap, BITMAP_SIZE, BITMAP_SIZE, 0, 1, null) == 0) {
            std.debug.print("Failed to initialize font\n", .{});
            return;
        }

        stb_tt.stbtt_PackSetOversampling(&context, OVERSAMPLE_X, OVERSAMPLE_Y);
        if (stb_tt.stbtt_PackFontRange(&context, &ttf_buffer, 0, FONT_SIZE, FIRST_CHAR, CHAR_COUNT, &state.char_info) == 0) {
            std.debug.print("Failed to pack font\n", .{});
            return;
        }

        stb_tt.stbtt_PackEnd(&context);

        stb_tt.stbtt_GetScaledFontVMetrics(&ttf_buffer, 0, FONT_SIZE, &state.ascent, &state.descent, &state.line_gap);

        std.debug.print("Ascent:{d}, Descent:{d}, Line-Gap:{d}\n", .{ state.ascent, state.descent, state.line_gap });
        // To avoid having 2 pipelines we need to re-use the same shader.
        // As the text shader requires a texture for the alpha-channel, we set the alpha
        // to 1.0 by passing a 1 pixel texture.
        // Also, to avoid having 2 bindings we need to re-use the same image.
        // This is achieved by stuffing some additional (alpha pixels) into the texture atlas
        // at the bottom-right and using those pixels for the background with uv (1.0,1.0).
        atlas_bitmap[atlas_bitmap.len - 1] = 0xff; // Full alpha.

        var img_desc: sg.ImageDesc = .{
            .width = BITMAP_SIZE,
            .height = BITMAP_SIZE,
            .pixel_format = .R8,
        };
        img_desc.data.subimage[0][0] = sg.asRange(&atlas_bitmap);
        state.bind.images[shd_txt.IMG_tex] = sg.makeImage(img_desc);
        state.bind.samplers[shd_txt.SMP_smp] = sg.makeSampler(.{
            .min_filter = .LINEAR,
            .mag_filter = .LINEAR,
            .wrap_u = .CLAMP_TO_EDGE,
            .wrap_v = .CLAMP_TO_EDGE,
        });
    }

    var pip_desc: sg.PipelineDesc = .{
        .shader = sg.makeShader(shd_txt.textShaderDesc(sg.queryBackend())),
        .index_type = .UINT16,
    };
    pip_desc.layout.attrs[shd_txt.ATTR_text_position].format = .FLOAT3;
    pip_desc.layout.attrs[shd_txt.ATTR_text_color0].format = .UBYTE4N;
    pip_desc.layout.attrs[shd_txt.ATTR_text_texcoord0].format = .FLOAT2;

    // Add alpha blending. Only needed for text as it's shape is in the alpha channel.
    pip_desc.colors[0].blend = .{
        .enabled = true,
        .src_factor_rgb = sg.BlendFactor.SRC_ALPHA,
        .dst_factor_rgb = sg.BlendFactor.ONE_MINUS_SRC_ALPHA,
    };
    state.pip = sg.makePipeline(pip_desc);

    state.pass_action.colors[0] = .{
        .load_action = .CLEAR,
        .clear_value = .{ .r = 0.2, .g = 0.2, .b = 0.2, .a = 1.0 },
    };

    state.bind.vertex_buffers[0] = sg.makeBuffer(.{
        .size = @sizeOf(Vertex) * 4 * MAX_LETTERS,
        .usage = .DYNAMIC,
    });

    state.bind.index_buffer = sg.makeBuffer(.{
        .size = @sizeOf(u16) * 6 * MAX_LETTERS,
        .type = .INDEXBUFFER,
        .usage = .DYNAMIC,
    });

    std.debug.print("appWidth:{d}, appHeight:{d}\n", .{ sapp.widthf(), sapp.heightf() });
    update_buffers();
}

//--------------------------------------------------------------------------------------------------
// NOTE: update buffer only when data changes.
// As these buffers are DYNAMIC and not STREAM, they should not be updated every single frame
//--------------------------------------------------------------------------------------------------
fn update_buffers() void {
    state.vert_buffer.clearRetainingCapacity();
    state.index_buffer.clearRetainingCapacity();

    const pad_x: f32 = 4;
    const pad_y: f32 = 20;
    const BOX_HEIGHT: f32 = state.ascent - state.descent + (2 * pad_y); // descent is negative.
    const BOX_WIDTH: f32 = 400;

    const INIT_X: f32 = pad_x;
    const INIT_Y: f32 = BOX_HEIGHT - state.ascent; // TODO: Adjust anchor so that position(0,0) is visible.

    var start_x: f32 = INIT_X;
    var start_y: f32 = INIT_Y;

    const heading_bg_colour = 0xff3e3e3e;
    const box_colours = [_]u32{
        0xffffe3cc, // blue
        0xffc2eaff, // orange
        0xffffbded, // lavender
        0xffc2ffdb, // green
    };

    for (state.tasks.items, 0..) |item, i| {
        // Start new column
        const is_heading: bool = (item.depth == 0);
        if (i != 0 and is_heading) {
            start_x += BOX_WIDTH;
            start_y = INIT_Y; // Start from top
        }

        var x = start_x;
        var y = start_y;
        var max_x = x;
        var min_y = y;

        // Backing box - Depends on knowing the final text metrics
        // BUT should be in the buffer BEFORE the text, so it's drawn first.
        // To resolve this catch-22, we add dummy values first and correct them
        // when we know the size of the text.
        // zig fmt: off
        const box_vert_idx = state.vert_buffer.items.len;
        {
            const index_base: u16 = @intCast(box_vert_idx);
            //const box_col = 0xffffe3cc;
            const box_col = if (is_heading) heading_bg_colour else box_colours[i % box_colours.len];
            state.vert_buffer.append(.{ .x = start_x-pad_x,     .y = start_y-state.descent+pad_y, .z = 0.0, .color = box_col, .u = 1.0, .v = 1.0 }) catch unreachable;
            state.vert_buffer.append(.{ .x = start_x+BOX_WIDTH, .y = start_y-state.descent+pad_y, .z = 0.0, .color = box_col, .u = 1.0, .v = 1.0 }) catch unreachable;
            state.vert_buffer.append(.{ .x = start_x+BOX_WIDTH, .y = start_y-state.ascent-pad_y,  .z = 0.0, .color = box_col, .u = 1.0, .v = 1.0 }) catch unreachable;
            state.vert_buffer.append(.{ .x = start_x-pad_x,     .y = start_y-state.ascent-pad_y,  .z = 0.0, .color = box_col, .u = 1.0, .v = 1.0 }) catch unreachable;

            state.index_buffer.append(index_base + 0) catch unreachable;
            state.index_buffer.append(index_base + 1) catch unreachable;
            state.index_buffer.append(index_base + 2) catch unreachable;
            state.index_buffer.append(index_base + 0) catch unreachable;
            state.index_buffer.append(index_base + 2) catch unreachable;
            state.index_buffer.append(index_base + 3) catch unreachable;
        }

        for (item.title) |char| {
            var q: stb_tt.stbtt_aligned_quad = .{};
            stb_tt.stbtt_GetPackedQuad(&state.char_info, BITMAP_SIZE, BITMAP_SIZE, char-FIRST_CHAR, &x, &y, &q, 1);//1=opengl & d3d10+,0=d3d9
            max_x = q.x1;
            min_y = q.y0;

            // TODO: color could be a Uniform passed to the shader
            const text_col: u32 = if (is_heading) 0xffffffff else 0xff000000;

            // bottom-left
            // bottom-right
            // top-right
            // top-left
            const index_base: u16 = @intCast(state.vert_buffer.items.len);
            state.vert_buffer.append(.{ .x = q.x0, .y = q.y1, .z = 0.0, .color = text_col, .u = q.s0, .v = q.t1 }) catch unreachable;
            state.vert_buffer.append(.{ .x = q.x1, .y = q.y1, .z = 0.0, .color = text_col, .u = q.s1, .v = q.t1 }) catch unreachable;
            state.vert_buffer.append(.{ .x = q.x1, .y = q.y0, .z = 0.0, .color = text_col, .u = q.s1, .v = q.t0 }) catch unreachable;
            state.vert_buffer.append(.{ .x = q.x0, .y = q.y0, .z = 0.0, .color = text_col, .u = q.s0, .v = q.t0 }) catch unreachable;

            state.index_buffer.append(index_base + 0) catch unreachable;
            state.index_buffer.append(index_base + 1) catch unreachable;
            state.index_buffer.append(index_base + 2) catch unreachable;
            state.index_buffer.append(index_base + 0) catch unreachable;
            state.index_buffer.append(index_base + 2) catch unreachable;
            state.index_buffer.append(index_base + 3) catch unreachable;
        }
        // zig fmt: on

        // Fix up the backing box size, now that we know the size of the text
        // state.vert_buffer.items[box_vert_idx + 1].x = max_x + pad_x;
        // state.vert_buffer.items[box_vert_idx + 2].x = max_x + pad_x;

        start_y += BOX_HEIGHT; // Next row

    } // for (state.tasks)

    sg.updateBuffer(state.bind.vertex_buffers[0], sg.asRange(state.vert_buffer.items));
    sg.updateBuffer(state.bind.index_buffer, sg.asRange(state.index_buffer.items));
}

//--------------------------------------------------------------------------------------------------
export fn frame() void {
    const proj = ortho(0.0, sapp.widthf(), sapp.heightf(), 0.0, -1.0, 1.0);
    const vs_params = shd_txt.VsParams{ .mvp = proj };
    sg.beginPass(.{ .action = state.pass_action, .swapchain = sglue.swapchain() });
    sg.applyPipeline(state.pip);
    sg.applyBindings(state.bind);
    sg.applyUniforms(shd_txt.UB_vs_params, sg.asRange(&vs_params));

    sg.draw(0, @intCast(state.index_buffer.items.len), 1);

    sg.endPass();
    sg.commit();
}

//--------------------------------------------------------------------------------------------------
export fn cleanup() void {
    sg.shutdown();
}

//--------------------------------------------------------------------------------------------------
export fn event(ev: [*c]const sapp.Event) void {
    _ = ev;
}

//--------------------------------------------------------------------------------------------------
const Recurrence = enum {
    none,
    daily,
    weekly,
    monthly,
    yearly,
    two_weekly,
    four_weekly,
};

const ActivationRange = enum {
    none,
    day,
    week,
    month,
    year,
};

const Task = struct {
    title: []const u8,
    description: []const u8 = "",
    recur: Recurrence = Recurrence.none,

    active_range: ActivationRange = ActivationRange.none,
    active_year: u16 = 0,
    active_month: u4 = 0,
    active_day_of_month: u5 = 0,

    enabled: bool = true,

    streak_current: u32 = 0,
    streak_best: u32 = 0,
    completed_count: u32 = 0,
    missed_count: u32 = 0,

    depth: usize, // Used for determining parent/child heirarchical depth
    parent: ?usize,
    children: std.ArrayList(usize),
};

//--------------------------------------------------------------------------------------------------
fn parse_activation_date(task: *Task, line: []const u8) void {
    std.debug.assert(line.len >= 4);

    var partition = std.mem.tokenizeAny(u8, line, " "); // Remove any garbage after the date
    const date_only = partition.next() orelse unreachable;

    // std.debug.print("!!!! PARSE DATE: {s}\n", .{date_only});
    var it = std.mem.tokenizeAny(u8, date_only, "-");

    // Year part (required)
    if (it.next()) |value| {
        // std.debug.print("   !! PARSE YEAR: {s}\n", .{value});
        task.active_year = std.fmt.parseInt(u16, value, 10) catch unreachable; // TODO: Proper error handling
        task.active_range = ActivationRange.year;
    } else {
        // TODO: Report Error
    }

    // Month part (optional)
    if (it.next()) |value| {
        // std.debug.print("   !! PARSE MONTH: {s}\n", .{value});
        task.active_month = std.fmt.parseInt(u4, value, 10) catch unreachable; // TODO: Proper error handling
        task.active_range = ActivationRange.month;
    }

    // Day part (optional)
    if (it.next()) |value| {
        // std.debug.print("   !! PARSE DAY: {s}\n", .{value});
        task.active_day_of_month = std.fmt.parseInt(u5, value, 10) catch unreachable; // TODO: Proper error handling
        task.active_range = ActivationRange.day;
    }
}

//--------------------------------------------------------------------------------------------------
fn has_meta_data(key: []const u8, line: []const u8) bool {
    return line.len >= key.len and std.mem.eql(u8, key, line[0..key.len]);
}

//--------------------------------------------------------------------------------------------------
fn add_meta_data(task: *Task, line: []const u8, allocator: Allocator) void {
    // std.debug.print(" !!! METADATA FOUND: {s}\n", .{line});

    // Requires reading followup data
    if (has_meta_data("ACTIVATE_DATE:", line)) { //
        const rest_of_line = line["ACTIVATE_DATE:".len..];
        parse_activation_date(task, rest_of_line); // TODO: Error handling

    } else if (has_meta_data("ACTIVATE_WEEK:", line)) { //
        const rest_of_line = line["ACTIVATE_WEEK:".len..];
        parse_activation_date(task, rest_of_line); // TODO: Error handling
        task.active_range = ActivationRange.week; // Overriding

    } else if (has_meta_data("DESC:", line)) { //
        const rest_of_line = line["DESC:".len..];
        const desc_string = allocator.dupe(u8, rest_of_line) catch return; // TODO: ignoring error
        task.description = desc_string;

        //TODO: do we want multi-line text?
    } else if (has_meta_data("DAILY", line)) { //
        // Standalone Flags
        task.recur = Recurrence.daily;
    } else if (has_meta_data("WEEKLY", line)) { //
        task.recur = Recurrence.weekly;
    } else if (has_meta_data("MONTHLY", line)) { //
        task.recur = Recurrence.monthly;
    } else if (has_meta_data("YEARLY", line)) { //
        task.recur = Recurrence.yearly;
    } else if (has_meta_data("TWO_WEEKLY", line)) { //
        task.recur = Recurrence.two_weekly;
    } else if (has_meta_data("FOUR_WEEKLY", line)) { //
        task.recur = Recurrence.four_weekly;
    } else if (has_meta_data("DISABLED", line)) { //
        task.enabled = false;
    }
}

//--------------------------------------------------------------------------------------------------
fn find_previous_parent_at_depth(tasks: std.ArrayList(Task), depth: usize) ?usize {
    std.debug.assert(tasks.items.len > 0);
    if (depth == 0) {
        return null; // Root nodes don't have parents.
    }

    var idx = tasks.items.len - 1;
    while (true) {
        // Found a first parent at higher level.
        if (tasks.items[idx].depth < depth) {
            return idx;
        }

        // Walk further up the tree
        if (tasks.items[idx].parent) |parent_idx| {
            idx = parent_idx;
        } else {
            unreachable;
        }
    }
}

//--------------------------------------------------------------------------------------------------
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var arena = std.heap.ArenaAllocator.init(allocator);
    defer arena.deinit();
    const string_allocator = arena.allocator();
    const vert_allocator = arena.allocator();

    state.vert_buffer = ArrayList(Vertex).init(vert_allocator);
    state.index_buffer = ArrayList(u16).init(vert_allocator);

    {
        const file = std.fs.cwd().openFile("S:/KanbanReplacementFile.txt", .{}) catch |err| {
            std.debug.print("unable to open file: {}\n", .{err});
            // const stderr = std.io.getStdErr();
            return;
        };
        defer file.close();

        const file_size = try file.getEndPos();
        std.log.info("File size {}\n", .{file_size});

        var reader = std.io.bufferedReader(file.reader());
        var istream = reader.reader();

        state.tasks = try ArrayList(Task).initCapacity(allocator, 256);

        var current_parent: ?usize = null;

        var line_buf: [2048]u8 = undefined;
        while (try istream.readUntilDelimiterOrEof(&line_buf, '\n')) |raw_line| {
            const line = std.mem.trimRight(u8, raw_line, "\r");

            // Parse Line
            //
            // Line starts with `-` then we create a new task (and stop adding content to previous)
            //  - Indentation determines if it's a child-task or sibling or parent task is finished.
            //
            // Line starts with `#` then we add meta-data to the task
            //
            // Ignore everything else
            for (line, 0..) |char, col| {
                if (char == '-') {
                    // Open new task

                    // Parent/child relationships
                    const prev_depth = if (state.tasks.items.len > 0)
                        state.tasks.items[state.tasks.items.len - 1].depth
                    else
                        0;

                    const indent = col;
                    if (indent > prev_depth) {
                        // Child task
                        current_parent = state.tasks.items.len - 1; // Previous task index
                    } else if (indent < prev_depth) {
                        // Walk back up the tree to find the last parent for tasks at this depth.
                        current_parent = find_previous_parent_at_depth(state.tasks, indent);
                    }

                    // Title
                    const rest_of_line = line[col + 1 ..];
                    const title_string = try string_allocator.dupe(u8, rest_of_line);

                    try state.tasks.append(Task{
                        .title = title_string,
                        .depth = indent,
                        .parent = current_parent,
                        .children = std.ArrayList(usize).init(allocator),
                    });
                    // Let the parent know they have just given birth
                    if (current_parent) |parent_idx| {
                        try state.tasks.items[parent_idx].children.append(state.tasks.items.len - 1);
                    }

                    // std.debug.print("ADDED: len:{d}:{s}\n", .{ title_string.len, title_string });
                    break;
                } else if (char == '#') {
                    std.debug.assert(state.tasks.items.len > 0);
                    add_meta_data(&state.tasks.items[state.tasks.items.len - 1], line[col + 1 ..], string_allocator);
                    break;
                } else if (char == ' ') {
                    continue;
                } else {
                    // Lines beginning with any other character are invalid and skipped
                    break;
                }
            }

            //TODO: (continue grabbing multi-line description)

        }
        std.debug.print("Num Items: {}\n", .{state.tasks.items.len});
        for (state.tasks.items) |item| {
            if (item.depth != 0) { // Root nodes at depth level 0 are the headings
                continue;
            }

            // std.debug.print("{} parent:{} >>{s} {},{},{},{},{}\n", //
            //     .{
            //     item.depth,               item.parent orelse 9, //
            //     item.title,               item.active_range,
            //     item.active_year,         item.active_month,
            //     item.active_day_of_month, item.recur,
            // });
            // // std.debug.print("   DESC: {s}\n", .{item.description});
            // for (item.children.items) |child| {
            //     std.debug.print("  {} parent:{} >>{s} {},{},{},{},{}\n", //
            //         .{
            //         tasks.items[child].depth,               tasks.items[child].parent orelse 9, //
            //         tasks.items[child].title,               tasks.items[child].active_range,
            //         tasks.items[child].active_year,         tasks.items[child].active_month,
            //         tasks.items[child].active_day_of_month, tasks.items[child].recur,
            //     });

            //     for (tasks.items[child].children.items) |child_l| {
            //         std.debug.print("    {} parent:{} >>{s} {},{},{},{},{}\n", //
            //             .{
            //             tasks.items[child_l].depth,               tasks.items[child_l].parent orelse 9, //
            //             tasks.items[child_l].title,               tasks.items[child_l].active_range,
            //             tasks.items[child_l].active_year,         tasks.items[child_l].active_month,
            //             tasks.items[child_l].active_day_of_month, tasks.items[child_l].recur,
            //         });
            //     }
            // }
        }
    }

    sapp.run(.{
        .init_cb = init,
        .frame_cb = frame,
        .cleanup_cb = cleanup,
        .event_cb = event,
        .window_title = "sokol-zig + Dear Imgui",
        .width = 800,
        .height = 600,
        .high_dpi = true,
        .icon = .{ .sokol_default = true },
        .logger = .{ .func = slog.func },
    });

    // Cleanup allocations
    for (state.tasks.items) |item| {
        item.children.deinit();
    }
    // TODO: move to state cleanup
    defer state.tasks.deinit();
}
