if (shake_time > 0) {
    var shake_x = irandom_range(-shake_strength, shake_strength);
    var shake_y = irandom_range(-shake_strength, shake_strength);
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + shake_x, camera_get_view_y(view_camera[0]) + shake_y);
    shake_time -= 1;
}
