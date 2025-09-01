if (position_meeting(obj_cursor.x, obj_cursor.y, id)) {
	image_index = 1;
} else {
	image_index = 0;
}
if (mouse_check_button_pressed(mb_left)
	&& position_meeting(obj_cursor.x, obj_cursor.y, id)) {
	obj_shop_dialogs.image_index = 5;
	with(obj_shop_dialogs) {
		alarm[2] = room_speed * 4;
	}
}
