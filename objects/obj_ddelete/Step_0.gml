if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1) 
	&& position_meeting(obj_cursor.x, obj_cursor.y, id)) {
		room_goto(game);
}
