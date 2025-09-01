if (frame_progress > 0) {
    var w = display_get_gui_width();
    var h = display_get_gui_height();
    
    var offset = lerp(w/2, 0, frame_progress); // рамка ползёт с краёв
    
    draw_set_color(c_red);
    draw_set_alpha(0.3);

    draw_rectangle(0, 0, w, offset, false);
    draw_rectangle(0, h-offset, w, h, false);
    draw_rectangle(0, 0, offset, h, false);
    draw_rectangle(w-offset, 0, w, h, false);

    draw_set_alpha(1);
}
