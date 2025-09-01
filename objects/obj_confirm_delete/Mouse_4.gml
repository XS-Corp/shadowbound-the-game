var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mx >= btn_yes_x && mx <= btn_yes_x + btn_width &&
    my >= btn_yes_y && my <= btn_yes_y + btn_height)
{
    if (file_exists("save.ini")) file_delete("save.ini");
    room_goto(game);
}

if (mx >= btn_no_x && mx <= btn_no_x + btn_width &&
    my >= btn_no_y && my <= btn_no_y + btn_height)
{
    room_goto(game);
}
