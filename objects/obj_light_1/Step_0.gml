if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x-16, y-16, x+16, y+16)) {
    on = !on;
}

if (gamepad_button_check_pressed(0, gp_face1) && (place_meeting(x, y, obj_cursor)))
{
    on = !on;
}
