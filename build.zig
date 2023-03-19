const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "lvgl",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    // 188 files
    // /usr/bin/cc
    // -DLV_CONF_INCLUDE_SIMPLE
    // -DLV_LVGL_H_INCLUDE_SIMPLE
    // -isystem /lvgl
    // -MD
    // -MT CMakeFiles/lvgl.dir/src/core/lv_disp.c.o
    // -MF CMakeFiles/lvgl.dir/src/core/lv_disp.c.o.d
    // -o CMakeFiles/lvgl.dir/src/core/lv_disp.c.o
    // -c /lvgl/src/core/lv_disp.c
    lib.linkLibC();
    lib.addIncludePath(".");
    lib.addCSourceFiles(&.{
        "src/lv_port_disp.c",
        "src/core/lv_obj.c",
        "src/core/lv_indev.c",
        "src/core/lv_obj_tree.c",
        "src/core/lv_indev_scroll.c",
        "src/core/lv_refr.c",
        "src/core/lv_disp.c",
        "src/core/lv_obj_style.c",
        "src/core/lv_obj_style_gen.c",
        "src/core/lv_obj_class.c",
        "src/core/lv_obj_draw.c",
        "src/core/lv_obj_scroll.c",
        "src/core/lv_group.c",
        "src/core/lv_theme.c",
        "src/core/lv_event.c",
        "src/core/lv_obj_pos.c",
        "src/font/lv_font_montserrat_28_compressed.c",
        "src/font/lv_font_montserrat_16.c",
        "src/font/lv_font_montserrat_44.c",
        "src/font/lv_font_montserrat_42.c",
        "src/font/lv_font_fmt_txt.c",
        "src/font/lv_font_montserrat_22.c",
        "src/font/lv_font.c",
        "src/font/lv_font_montserrat_12_subpx.c",
        "src/font/lv_font_montserrat_48.c",
        "src/font/lv_font_montserrat_34.c",
        "src/font/lv_font_montserrat_46.c",
        "src/font/lv_font_montserrat_28.c",
        "src/font/lv_font_montserrat_30.c",
        "src/font/lv_font_montserrat_18.c",
        "src/font/lv_font_montserrat_8.c",
        "src/font/lv_font_montserrat_38.c",
        "src/font/lv_font_montserrat_14.c",
        "src/font/lv_font_unscii_16.c",
        "src/font/lv_font_montserrat_36.c",
        "src/font/lv_font_loader.c",
        "src/font/lv_font_montserrat_20.c",
        "src/font/lv_font_montserrat_26.c",
        "src/font/lv_font_montserrat_12.c",
        "src/font/lv_font_montserrat_32.c",
        "src/font/lv_font_dejavu_16_persian_hebrew.c",
        "src/font/lv_font_unscii_8.c",
        "src/font/lv_font_montserrat_40.c",
        "src/font/lv_font_montserrat_24.c",
        "src/font/lv_font_simsun_16_cjk.c",
        "src/font/lv_font_montserrat_10.c",
        "src/extra/themes/default/lv_theme_default.c",
        "src/extra/themes/mono/lv_theme_mono.c",
        "src/extra/themes/basic/lv_theme_basic.c",
        "src/extra/lv_extra.c",
        "src/extra/libs/sjpg/tjpgd.c",
        "src/extra/libs/sjpg/lv_sjpg.c",
        "src/extra/libs/ffmpeg/lv_ffmpeg.c",
        "src/extra/libs/rlottie/lv_rlottie.c",
        "src/extra/libs/bmp/lv_bmp.c",
        "src/extra/libs/qrcode/lv_qrcode.c",
        "src/extra/libs/qrcode/qrcodegen.c",
        "src/extra/libs/fsdrv/lv_fs_win32.c",
        "src/extra/libs/fsdrv/lv_fs_fatfs.c",
        "src/extra/libs/fsdrv/lv_fs_stdio.c",
        "src/extra/libs/fsdrv/lv_fs_posix.c",
        "src/extra/libs/freetype/lv_freetype.c",
        "src/extra/libs/png/lv_png.c",
        "src/extra/libs/png/lodepng.c",
        "src/extra/libs/gif/lv_gif.c",
        "src/extra/libs/gif/gifdec.c",
        "src/extra/layouts/flex/lv_flex.c",
        "src/extra/layouts/grid/lv_grid.c",
        "src/extra/others/monkey/lv_monkey.c",
        "src/extra/others/fragment/lv_fragment.c",
        "src/extra/others/fragment/lv_fragment_manager.c",
        "src/extra/others/ime/lv_ime_pinyin.c",
        "src/extra/others/msg/lv_msg.c",
        "src/extra/others/gridnav/lv_gridnav.c",
        "src/extra/others/snapshot/lv_snapshot.c",
        "src/extra/others/imgfont/lv_imgfont.c",
        "src/extra/widgets/meter/lv_meter.c",
        "src/extra/widgets/list/lv_list.c",
        "src/extra/widgets/tabview/lv_tabview.c",
        "src/extra/widgets/msgbox/lv_msgbox.c",
        "src/extra/widgets/imgbtn/lv_imgbtn.c",
        "src/extra/widgets/win/lv_win.c",
        "src/extra/widgets/tileview/lv_tileview.c",
        "src/extra/widgets/span/lv_span.c",
        "src/extra/widgets/chart/lv_chart.c",
        "src/extra/widgets/keyboard/lv_keyboard.c",
        "src/extra/widgets/colorwheel/lv_colorwheel.c",
        "src/extra/widgets/calendar/lv_calendar.c",
        "src/extra/widgets/calendar/lv_calendar_header_dropdown.c",
        "src/extra/widgets/calendar/lv_calendar_header_arrow.c",
        "src/extra/widgets/spinner/lv_spinner.c",
        "src/extra/widgets/spinbox/lv_spinbox.c",
        "src/extra/widgets/animimg/lv_animimg.c",
        "src/extra/widgets/led/lv_led.c",
        "src/extra/widgets/menu/lv_menu.c",
        "src/misc/lv_bidi.c",
        "src/misc/lv_anim.c",
        "src/misc/lv_style_gen.c",
        "src/misc/lv_color.c",
        "src/misc/lv_anim_timeline.c",
        "src/misc/lv_utils.c",
        "src/misc/lv_fs.c",
        "src/misc/lv_txt_ap.c",
        "src/misc/lv_lru.c",
        "src/misc/lv_async.c",
        "src/misc/lv_tlsf.c",
        "src/misc/lv_timer.c",
        "src/misc/lv_area.c",
        "src/misc/lv_math.c",
        "src/misc/lv_ll.c",
        "src/misc/lv_log.c",
        "src/misc/lv_gc.c",
        "src/misc/lv_printf.c",
        "src/misc/lv_txt.c",
        "src/misc/lv_mem.c",
        "src/misc/lv_style.c",
        "src/misc/lv_templ.c",
        "src/hal/lv_hal_tick.c",
        "src/hal/lv_hal_disp.c",
        "src/hal/lv_hal_indev.c",
        "src/widgets/lv_img.c",
        "src/widgets/lv_btn.c",
        "src/widgets/lv_roller.c",
        "src/widgets/lv_bar.c",
        "src/widgets/lv_checkbox.c",
        "src/widgets/lv_textarea.c",
        "src/widgets/lv_arc.c",
        "src/widgets/lv_slider.c",
        "src/widgets/lv_btnmatrix.c",
        "src/widgets/lv_line.c",
        "src/widgets/lv_switch.c",
        "src/widgets/lv_canvas.c",
        "src/widgets/lv_objx_templ.c",
        "src/widgets/lv_table.c",
        "src/widgets/lv_label.c",
        "src/widgets/lv_dropdown.c",
        "src/draw/sw/lv_draw_sw.c",
        "src/draw/sw/lv_draw_sw_gradient.c",
        "src/draw/sw/lv_draw_sw_line.c",
        "src/draw/sw/lv_draw_sw_polygon.c",
        "src/draw/sw/lv_draw_sw_img.c",
        "src/draw/sw/lv_draw_sw_layer.c",
        "src/draw/sw/lv_draw_sw_transform.c",
        "src/draw/sw/lv_draw_sw_rect.c",
        "src/draw/sw/lv_draw_sw_letter.c",
        "src/draw/sw/lv_draw_sw_blend.c",
        "src/draw/sw/lv_draw_sw_dither.c",
        "src/draw/sw/lv_draw_sw_arc.c",
        "src/draw/lv_draw_label.c",
        "src/draw/lv_draw_transform.c",
        "src/draw/lv_draw.c",
        "src/draw/lv_draw_layer.c",
        "src/draw/lv_draw_rect.c",
        "src/draw/lv_img_cache.c",
        "src/draw/lv_draw_triangle.c",
        "src/draw/swm341_dma2d/lv_gpu_swm341_dma2d.c",
        "src/draw/arm2d/lv_gpu_arm2d.c",
        "src/draw/lv_draw_arc.c",
        "src/draw/lv_img_buf.c",
        "src/draw/lv_img_decoder.c",
        "src/draw/lv_draw_mask.c",
        "src/draw/lv_draw_img.c",
        "src/draw/lv_draw_line.c",
        "src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c",
        "src/draw/nxp/vglite/lv_draw_vglite_rect.c",
        "src/draw/nxp/vglite/lv_vglite_buf.c",
        "src/draw/nxp/vglite/lv_draw_vglite_arc.c",
        "src/draw/nxp/vglite/lv_vglite_utils.c",
        "src/draw/nxp/vglite/lv_draw_vglite.c",
        "src/draw/nxp/vglite/lv_draw_vglite_line.c",
        "src/draw/nxp/vglite/lv_draw_vglite_blend.c",
        "src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c",
        "src/draw/nxp/pxp/lv_draw_pxp_blend.c",
        "src/draw/nxp/pxp/lv_gpu_nxp_pxp.c",
        "src/draw/nxp/pxp/lv_draw_pxp.c",
        "src/draw/sdl/lv_draw_sdl.c",
        "src/draw/sdl/lv_draw_sdl_mask.c",
        "src/draw/sdl/lv_draw_sdl_rect.c",
        "src/draw/sdl/lv_draw_sdl_img.c",
        "src/draw/sdl/lv_draw_sdl_stack_blur.c",
        "src/draw/sdl/lv_draw_sdl_line.c",
        "src/draw/sdl/lv_draw_sdl_utils.c",
        "src/draw/sdl/lv_draw_sdl_layer.c",
        "src/draw/sdl/lv_draw_sdl_composite.c",
        "src/draw/sdl/lv_draw_sdl_texture_cache.c",
        "src/draw/sdl/lv_draw_sdl_polygon.c",
        "src/draw/sdl/lv_draw_sdl_arc.c",
        "src/draw/sdl/lv_draw_sdl_label.c",
        "src/draw/sdl/lv_draw_sdl_bg.c",
    }, &.{
        "-DLV_CONF_INCLUDE_SIMPLE",
        "-DLV_LVGL_H_INCLUDE_SIMPLE",
    });
    // This declares intent for the library to be installed into the standard
    // location when the user invokes the "install" step (the default step when
    // running `zig build`).
    lib.install();

    // Creates a step for unit testing.
    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build test`
    // This will evaluate the `test` step rather than the default, which is "install".
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
