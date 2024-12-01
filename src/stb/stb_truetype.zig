pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const stbtt__buf = extern struct {
    data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    cursor: c_int = @import("std").mem.zeroes(c_int),
    size: c_int = @import("std").mem.zeroes(c_int),
};
pub const stbtt_bakedchar = extern struct {
    x0: c_ushort = @import("std").mem.zeroes(c_ushort),
    y0: c_ushort = @import("std").mem.zeroes(c_ushort),
    x1: c_ushort = @import("std").mem.zeroes(c_ushort),
    y1: c_ushort = @import("std").mem.zeroes(c_ushort),
    xoff: f32 = @import("std").mem.zeroes(f32),
    yoff: f32 = @import("std").mem.zeroes(f32),
    xadvance: f32 = @import("std").mem.zeroes(f32),
};
pub extern fn stbtt_BakeFontBitmap(data: [*c]const u8, offset: c_int, pixel_height: f32, pixels: [*c]u8, pw: c_int, ph: c_int, first_char: c_int, num_chars: c_int, chardata: [*c]stbtt_bakedchar) c_int;
pub const stbtt_aligned_quad = extern struct {
    x0: f32 = @import("std").mem.zeroes(f32),
    y0: f32 = @import("std").mem.zeroes(f32),
    s0: f32 = @import("std").mem.zeroes(f32),
    t0: f32 = @import("std").mem.zeroes(f32),
    x1: f32 = @import("std").mem.zeroes(f32),
    y1: f32 = @import("std").mem.zeroes(f32),
    s1: f32 = @import("std").mem.zeroes(f32),
    t1: f32 = @import("std").mem.zeroes(f32),
};
pub extern fn stbtt_GetBakedQuad(chardata: [*c]const stbtt_bakedchar, pw: c_int, ph: c_int, char_index: c_int, xpos: [*c]f32, ypos: [*c]f32, q: [*c]stbtt_aligned_quad, opengl_fillrule: c_int) void;
pub extern fn stbtt_GetScaledFontVMetrics(fontdata: [*c]const u8, index: c_int, size: f32, ascent: [*c]f32, descent: [*c]f32, lineGap: [*c]f32) void;
pub const stbtt_packedchar = extern struct {
    x0: c_ushort = @import("std").mem.zeroes(c_ushort),
    y0: c_ushort = @import("std").mem.zeroes(c_ushort),
    x1: c_ushort = @import("std").mem.zeroes(c_ushort),
    y1: c_ushort = @import("std").mem.zeroes(c_ushort),
    xoff: f32 = @import("std").mem.zeroes(f32),
    yoff: f32 = @import("std").mem.zeroes(f32),
    xadvance: f32 = @import("std").mem.zeroes(f32),
    xoff2: f32 = @import("std").mem.zeroes(f32),
    yoff2: f32 = @import("std").mem.zeroes(f32),
};
pub const struct_stbtt_pack_context = extern struct {
    user_allocator_context: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pack_info: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    width: c_int = @import("std").mem.zeroes(c_int),
    height: c_int = @import("std").mem.zeroes(c_int),
    stride_in_bytes: c_int = @import("std").mem.zeroes(c_int),
    padding: c_int = @import("std").mem.zeroes(c_int),
    skip_missing: c_int = @import("std").mem.zeroes(c_int),
    h_oversample: c_uint = @import("std").mem.zeroes(c_uint),
    v_oversample: c_uint = @import("std").mem.zeroes(c_uint),
    pixels: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    nodes: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const stbtt_pack_context = struct_stbtt_pack_context;
pub const struct_stbtt_fontinfo = extern struct {
    userdata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    fontstart: c_int = @import("std").mem.zeroes(c_int),
    numGlyphs: c_int = @import("std").mem.zeroes(c_int),
    loca: c_int = @import("std").mem.zeroes(c_int),
    head: c_int = @import("std").mem.zeroes(c_int),
    glyf: c_int = @import("std").mem.zeroes(c_int),
    hhea: c_int = @import("std").mem.zeroes(c_int),
    hmtx: c_int = @import("std").mem.zeroes(c_int),
    kern: c_int = @import("std").mem.zeroes(c_int),
    gpos: c_int = @import("std").mem.zeroes(c_int),
    svg: c_int = @import("std").mem.zeroes(c_int),
    index_map: c_int = @import("std").mem.zeroes(c_int),
    indexToLocFormat: c_int = @import("std").mem.zeroes(c_int),
    cff: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
    charstrings: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
    gsubrs: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
    subrs: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
    fontdicts: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
    fdselect: stbtt__buf = @import("std").mem.zeroes(stbtt__buf),
};
pub const stbtt_fontinfo = struct_stbtt_fontinfo;
pub const struct_stbrp_rect = opaque {};
pub const stbrp_rect = struct_stbrp_rect;
pub extern fn stbtt_PackBegin(spc: [*c]stbtt_pack_context, pixels: [*c]u8, width: c_int, height: c_int, stride_in_bytes: c_int, padding: c_int, alloc_context: ?*anyopaque) c_int;
pub extern fn stbtt_PackEnd(spc: [*c]stbtt_pack_context) void;
pub extern fn stbtt_PackFontRange(spc: [*c]stbtt_pack_context, fontdata: [*c]const u8, font_index: c_int, font_size: f32, first_unicode_char_in_range: c_int, num_chars_in_range: c_int, chardata_for_range: [*c]stbtt_packedchar) c_int;
pub const stbtt_pack_range = extern struct {
    font_size: f32 = @import("std").mem.zeroes(f32),
    first_unicode_codepoint_in_range: c_int = @import("std").mem.zeroes(c_int),
    array_of_unicode_codepoints: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    num_chars: c_int = @import("std").mem.zeroes(c_int),
    chardata_for_range: [*c]stbtt_packedchar = @import("std").mem.zeroes([*c]stbtt_packedchar),
    h_oversample: u8 = @import("std").mem.zeroes(u8),
    v_oversample: u8 = @import("std").mem.zeroes(u8),
};
pub extern fn stbtt_PackFontRanges(spc: [*c]stbtt_pack_context, fontdata: [*c]const u8, font_index: c_int, ranges: [*c]stbtt_pack_range, num_ranges: c_int) c_int;
pub extern fn stbtt_PackSetOversampling(spc: [*c]stbtt_pack_context, h_oversample: c_uint, v_oversample: c_uint) void;
pub extern fn stbtt_PackSetSkipMissingCodepoints(spc: [*c]stbtt_pack_context, skip: c_int) void;
pub extern fn stbtt_GetPackedQuad(chardata: [*c]const stbtt_packedchar, pw: c_int, ph: c_int, char_index: c_int, xpos: [*c]f32, ypos: [*c]f32, q: [*c]stbtt_aligned_quad, align_to_integer: c_int) void;
pub extern fn stbtt_PackFontRangesGatherRects(spc: [*c]stbtt_pack_context, info: [*c]const stbtt_fontinfo, ranges: [*c]stbtt_pack_range, num_ranges: c_int, rects: ?*stbrp_rect) c_int;
pub extern fn stbtt_PackFontRangesPackRects(spc: [*c]stbtt_pack_context, rects: ?*stbrp_rect, num_rects: c_int) void;
pub extern fn stbtt_PackFontRangesRenderIntoRects(spc: [*c]stbtt_pack_context, info: [*c]const stbtt_fontinfo, ranges: [*c]stbtt_pack_range, num_ranges: c_int, rects: ?*stbrp_rect) c_int;
pub extern fn stbtt_GetNumberOfFonts(data: [*c]const u8) c_int;
pub extern fn stbtt_GetFontOffsetForIndex(data: [*c]const u8, index: c_int) c_int;
pub extern fn stbtt_InitFont(info: [*c]stbtt_fontinfo, data: [*c]const u8, offset: c_int) c_int;
pub extern fn stbtt_FindGlyphIndex(info: [*c]const stbtt_fontinfo, unicode_codepoint: c_int) c_int;
pub extern fn stbtt_ScaleForPixelHeight(info: [*c]const stbtt_fontinfo, pixels: f32) f32;
pub extern fn stbtt_ScaleForMappingEmToPixels(info: [*c]const stbtt_fontinfo, pixels: f32) f32;
pub extern fn stbtt_GetFontVMetrics(info: [*c]const stbtt_fontinfo, ascent: [*c]c_int, descent: [*c]c_int, lineGap: [*c]c_int) void;
pub extern fn stbtt_GetFontVMetricsOS2(info: [*c]const stbtt_fontinfo, typoAscent: [*c]c_int, typoDescent: [*c]c_int, typoLineGap: [*c]c_int) c_int;
pub extern fn stbtt_GetFontBoundingBox(info: [*c]const stbtt_fontinfo, x0: [*c]c_int, y0: [*c]c_int, x1: [*c]c_int, y1: [*c]c_int) void;
pub extern fn stbtt_GetCodepointHMetrics(info: [*c]const stbtt_fontinfo, codepoint: c_int, advanceWidth: [*c]c_int, leftSideBearing: [*c]c_int) void;
pub extern fn stbtt_GetCodepointKernAdvance(info: [*c]const stbtt_fontinfo, ch1: c_int, ch2: c_int) c_int;
pub extern fn stbtt_GetCodepointBox(info: [*c]const stbtt_fontinfo, codepoint: c_int, x0: [*c]c_int, y0: [*c]c_int, x1: [*c]c_int, y1: [*c]c_int) c_int;
pub extern fn stbtt_GetGlyphHMetrics(info: [*c]const stbtt_fontinfo, glyph_index: c_int, advanceWidth: [*c]c_int, leftSideBearing: [*c]c_int) void;
pub extern fn stbtt_GetGlyphKernAdvance(info: [*c]const stbtt_fontinfo, glyph1: c_int, glyph2: c_int) c_int;
pub extern fn stbtt_GetGlyphBox(info: [*c]const stbtt_fontinfo, glyph_index: c_int, x0: [*c]c_int, y0: [*c]c_int, x1: [*c]c_int, y1: [*c]c_int) c_int;
pub const struct_stbtt_kerningentry = extern struct {
    glyph1: c_int = @import("std").mem.zeroes(c_int),
    glyph2: c_int = @import("std").mem.zeroes(c_int),
    advance: c_int = @import("std").mem.zeroes(c_int),
};
pub const stbtt_kerningentry = struct_stbtt_kerningentry;
pub extern fn stbtt_GetKerningTableLength(info: [*c]const stbtt_fontinfo) c_int;
pub extern fn stbtt_GetKerningTable(info: [*c]const stbtt_fontinfo, table: [*c]stbtt_kerningentry, table_length: c_int) c_int;
pub const STBTT_vmove: c_int = 1;
pub const STBTT_vline: c_int = 2;
pub const STBTT_vcurve: c_int = 3;
pub const STBTT_vcubic: c_int = 4;
const enum_unnamed_1 = c_uint;
pub const stbtt_vertex = extern struct {
    x: c_short = @import("std").mem.zeroes(c_short),
    y: c_short = @import("std").mem.zeroes(c_short),
    cx: c_short = @import("std").mem.zeroes(c_short),
    cy: c_short = @import("std").mem.zeroes(c_short),
    cx1: c_short = @import("std").mem.zeroes(c_short),
    cy1: c_short = @import("std").mem.zeroes(c_short),
    type: u8 = @import("std").mem.zeroes(u8),
    padding: u8 = @import("std").mem.zeroes(u8),
};
pub extern fn stbtt_IsGlyphEmpty(info: [*c]const stbtt_fontinfo, glyph_index: c_int) c_int;
pub extern fn stbtt_GetCodepointShape(info: [*c]const stbtt_fontinfo, unicode_codepoint: c_int, vertices: [*c][*c]stbtt_vertex) c_int;
pub extern fn stbtt_GetGlyphShape(info: [*c]const stbtt_fontinfo, glyph_index: c_int, vertices: [*c][*c]stbtt_vertex) c_int;
pub extern fn stbtt_FreeShape(info: [*c]const stbtt_fontinfo, vertices: [*c]stbtt_vertex) void;
pub extern fn stbtt_FindSVGDoc(info: [*c]const stbtt_fontinfo, gl: c_int) [*c]u8;
pub extern fn stbtt_GetCodepointSVG(info: [*c]const stbtt_fontinfo, unicode_codepoint: c_int, svg: [*c][*c]const u8) c_int;
pub extern fn stbtt_GetGlyphSVG(info: [*c]const stbtt_fontinfo, gl: c_int, svg: [*c][*c]const u8) c_int;
pub extern fn stbtt_FreeBitmap(bitmap: [*c]u8, userdata: ?*anyopaque) void;
pub extern fn stbtt_GetCodepointBitmap(info: [*c]const stbtt_fontinfo, scale_x: f32, scale_y: f32, codepoint: c_int, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_GetCodepointBitmapSubpixel(info: [*c]const stbtt_fontinfo, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, codepoint: c_int, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_MakeCodepointBitmap(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, codepoint: c_int) void;
pub extern fn stbtt_MakeCodepointBitmapSubpixel(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, codepoint: c_int) void;
pub extern fn stbtt_MakeCodepointBitmapSubpixelPrefilter(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, oversample_x: c_int, oversample_y: c_int, sub_x: [*c]f32, sub_y: [*c]f32, codepoint: c_int) void;
pub extern fn stbtt_GetCodepointBitmapBox(font: [*c]const stbtt_fontinfo, codepoint: c_int, scale_x: f32, scale_y: f32, ix0: [*c]c_int, iy0: [*c]c_int, ix1: [*c]c_int, iy1: [*c]c_int) void;
pub extern fn stbtt_GetCodepointBitmapBoxSubpixel(font: [*c]const stbtt_fontinfo, codepoint: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, ix0: [*c]c_int, iy0: [*c]c_int, ix1: [*c]c_int, iy1: [*c]c_int) void;
pub extern fn stbtt_GetGlyphBitmap(info: [*c]const stbtt_fontinfo, scale_x: f32, scale_y: f32, glyph: c_int, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_GetGlyphBitmapSubpixel(info: [*c]const stbtt_fontinfo, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, glyph: c_int, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_MakeGlyphBitmap(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, glyph: c_int) void;
pub extern fn stbtt_MakeGlyphBitmapSubpixel(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, glyph: c_int) void;
pub extern fn stbtt_MakeGlyphBitmapSubpixelPrefilter(info: [*c]const stbtt_fontinfo, output: [*c]u8, out_w: c_int, out_h: c_int, out_stride: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, oversample_x: c_int, oversample_y: c_int, sub_x: [*c]f32, sub_y: [*c]f32, glyph: c_int) void;
pub extern fn stbtt_GetGlyphBitmapBox(font: [*c]const stbtt_fontinfo, glyph: c_int, scale_x: f32, scale_y: f32, ix0: [*c]c_int, iy0: [*c]c_int, ix1: [*c]c_int, iy1: [*c]c_int) void;
pub extern fn stbtt_GetGlyphBitmapBoxSubpixel(font: [*c]const stbtt_fontinfo, glyph: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, ix0: [*c]c_int, iy0: [*c]c_int, ix1: [*c]c_int, iy1: [*c]c_int) void;
pub const stbtt__bitmap = extern struct {
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
    stride: c_int = @import("std").mem.zeroes(c_int),
    pixels: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub extern fn stbtt_Rasterize(result: [*c]stbtt__bitmap, flatness_in_pixels: f32, vertices: [*c]stbtt_vertex, num_verts: c_int, scale_x: f32, scale_y: f32, shift_x: f32, shift_y: f32, x_off: c_int, y_off: c_int, invert: c_int, userdata: ?*anyopaque) void;
pub extern fn stbtt_FreeSDF(bitmap: [*c]u8, userdata: ?*anyopaque) void;
pub extern fn stbtt_GetGlyphSDF(info: [*c]const stbtt_fontinfo, scale: f32, glyph: c_int, padding: c_int, onedge_value: u8, pixel_dist_scale: f32, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_GetCodepointSDF(info: [*c]const stbtt_fontinfo, scale: f32, codepoint: c_int, padding: c_int, onedge_value: u8, pixel_dist_scale: f32, width: [*c]c_int, height: [*c]c_int, xoff: [*c]c_int, yoff: [*c]c_int) [*c]u8;
pub extern fn stbtt_FindMatchingFont(fontdata: [*c]const u8, name: [*c]const u8, flags: c_int) c_int;
pub extern fn stbtt_CompareUTF8toUTF16_bigendian(s1: [*c]const u8, len1: c_int, s2: [*c]const u8, len2: c_int) c_int;
pub extern fn stbtt_GetFontNameString(font: [*c]const stbtt_fontinfo, length: [*c]c_int, platformID: c_int, encodingID: c_int, languageID: c_int, nameID: c_int) [*c]const u8;
pub const STBTT_PLATFORM_ID_UNICODE: c_int = 0;
pub const STBTT_PLATFORM_ID_MAC: c_int = 1;
pub const STBTT_PLATFORM_ID_ISO: c_int = 2;
pub const STBTT_PLATFORM_ID_MICROSOFT: c_int = 3;
const enum_unnamed_2 = c_uint;
pub const STBTT_UNICODE_EID_UNICODE_1_0: c_int = 0;
pub const STBTT_UNICODE_EID_UNICODE_1_1: c_int = 1;
pub const STBTT_UNICODE_EID_ISO_10646: c_int = 2;
pub const STBTT_UNICODE_EID_UNICODE_2_0_BMP: c_int = 3;
pub const STBTT_UNICODE_EID_UNICODE_2_0_FULL: c_int = 4;
const enum_unnamed_3 = c_uint;
pub const STBTT_MS_EID_SYMBOL: c_int = 0;
pub const STBTT_MS_EID_UNICODE_BMP: c_int = 1;
pub const STBTT_MS_EID_SHIFTJIS: c_int = 2;
pub const STBTT_MS_EID_UNICODE_FULL: c_int = 10;
const enum_unnamed_4 = c_uint;
pub const STBTT_MAC_EID_ROMAN: c_int = 0;
pub const STBTT_MAC_EID_ARABIC: c_int = 4;
pub const STBTT_MAC_EID_JAPANESE: c_int = 1;
pub const STBTT_MAC_EID_HEBREW: c_int = 5;
pub const STBTT_MAC_EID_CHINESE_TRAD: c_int = 2;
pub const STBTT_MAC_EID_GREEK: c_int = 6;
pub const STBTT_MAC_EID_KOREAN: c_int = 3;
pub const STBTT_MAC_EID_RUSSIAN: c_int = 7;
const enum_unnamed_5 = c_uint;
pub const STBTT_MS_LANG_ENGLISH: c_int = 1033;
pub const STBTT_MS_LANG_ITALIAN: c_int = 1040;
pub const STBTT_MS_LANG_CHINESE: c_int = 2052;
pub const STBTT_MS_LANG_JAPANESE: c_int = 1041;
pub const STBTT_MS_LANG_DUTCH: c_int = 1043;
pub const STBTT_MS_LANG_KOREAN: c_int = 1042;
pub const STBTT_MS_LANG_FRENCH: c_int = 1036;
pub const STBTT_MS_LANG_RUSSIAN: c_int = 1049;
pub const STBTT_MS_LANG_GERMAN: c_int = 1031;
pub const STBTT_MS_LANG_SPANISH: c_int = 1033;
pub const STBTT_MS_LANG_HEBREW: c_int = 1037;
pub const STBTT_MS_LANG_SWEDISH: c_int = 1053;
const enum_unnamed_6 = c_uint;
pub const STBTT_MAC_LANG_ENGLISH: c_int = 0;
pub const STBTT_MAC_LANG_JAPANESE: c_int = 11;
pub const STBTT_MAC_LANG_ARABIC: c_int = 12;
pub const STBTT_MAC_LANG_KOREAN: c_int = 23;
pub const STBTT_MAC_LANG_DUTCH: c_int = 4;
pub const STBTT_MAC_LANG_RUSSIAN: c_int = 32;
pub const STBTT_MAC_LANG_FRENCH: c_int = 1;
pub const STBTT_MAC_LANG_SPANISH: c_int = 6;
pub const STBTT_MAC_LANG_GERMAN: c_int = 2;
pub const STBTT_MAC_LANG_SWEDISH: c_int = 5;
pub const STBTT_MAC_LANG_HEBREW: c_int = 10;
pub const STBTT_MAC_LANG_CHINESE_SIMPLIFIED: c_int = 33;
pub const STBTT_MAC_LANG_ITALIAN: c_int = 3;
pub const STBTT_MAC_LANG_CHINESE_TRAD: c_int = 19;
const enum_unnamed_7 = c_uint;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 18);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 6);
pub const __clang_version__ = "18.1.6 (https://github.com/ziglang/zig-bootstrap 98bc6bf4fc4009888d33941daf6b600d20a42a56)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 18.1.6 (https://github.com/ziglang/zig-bootstrap 98bc6bf4fc4009888d33941daf6b600d20a42a56)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __SEH__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-16";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 16);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_WINT_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_FMTd__ = "lld";
pub const __INTMAX_FMTi__ = "lli";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):94:9
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_FMTo__ = "llo";
pub const __UINTMAX_FMTu__ = "llu";
pub const __UINTMAX_FMTx__ = "llx";
pub const __UINTMAX_FMTX__ = "llX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):100:9
pub const __PTRDIFF_TYPE__ = c_longlong;
pub const __PTRDIFF_FMTd__ = "lld";
pub const __PTRDIFF_FMTi__ = "lli";
pub const __INTPTR_TYPE__ = c_longlong;
pub const __INTPTR_FMTd__ = "lld";
pub const __INTPTR_FMTi__ = "lli";
pub const __SIZE_TYPE__ = c_ulonglong;
pub const __SIZE_FMTo__ = "llo";
pub const __SIZE_FMTu__ = "llu";
pub const __SIZE_FMTx__ = "llx";
pub const __SIZE_FMTX__ = "llX";
pub const __WCHAR_TYPE__ = c_ushort;
pub const __WINT_TYPE__ = c_ushort;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulonglong;
pub const __UINTPTR_FMTo__ = "llo";
pub const __UINTPTR_FMTu__ = "llu";
pub const __UINTPTR_FMTx__ = "llx";
pub const __UINTPTR_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):198:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):220:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):228:9
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):356:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):357:9
pub const __znver3 = @as(c_int, 1);
pub const __znver3__ = @as(c_int, 1);
pub const __tune_znver3__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub const __declspec = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// (no file):425:9
pub const _cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// (no file):426:9
pub const __cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// (no file):427:9
pub const _stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// (no file):428:9
pub const __stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// (no file):429:9
pub const _fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// (no file):430:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// (no file):431:9
pub const _thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// (no file):432:9
pub const __thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// (no file):433:9
pub const _pascal = @compileError("unable to translate macro: undefined identifier `__pascal__`");
// (no file):434:9
pub const __pascal = @compileError("unable to translate macro: undefined identifier `__pascal__`");
// (no file):435:9
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __STB_INCLUDE_STB_TRUETYPE_H__ = "";
pub const STBTT_DEF = @compileError("unable to translate C expr: unexpected token 'extern'");
// .\stb_truetype.h:505:9
pub inline fn STBTT_POINT_SIZE(x: anytype) @TypeOf(-x) {
    _ = &x;
    return -x;
}
pub const stbtt_vertex_type = c_short;
pub const STBTT_MACSTYLE_DONTCARE = @as(c_int, 0);
pub const STBTT_MACSTYLE_BOLD = @as(c_int, 1);
pub const STBTT_MACSTYLE_ITALIC = @as(c_int, 2);
pub const STBTT_MACSTYLE_UNDERSCORE = @as(c_int, 4);
pub const STBTT_MACSTYLE_NONE = @as(c_int, 8);
