if (position_meeting(obj_cursor.x, obj_cursor.y, id)) {
	image_index = 1;
} else {
	image_index = 0;
}
if (global.bought_ltime) {
	instance_destroy();
} else {
if (mouse_check_button_pressed(mb_left)
	&& position_meeting(obj_cursor.x, obj_cursor.y, id)) {
	if (global.shadowcoins >= 4) {
		global.shadowcoins -= 4;
		global.bought_ltime = true;
		save_globals_to_ini("save.ini", "GameData");
		obj_shop_dialogs.image_index = 3;
		with(obj_shop_dialogs) {
			alarm[0] = room_speed * 4;
		}
	}
	else {
		obj_shop_dialogs.image_index = 2;
		with(obj_shop_dialogs) {
			alarm[0] = room_speed * 4;
		}
	}
}
if (mouse_check_button_pressed(mb_middle)
&& position_meeting(obj_cursor.x, obj_cursor.y, id)) {
	global.bought_ltime = true;
	global.stole_item = true;
	save_globals_to_ini("save.ini", "GameData");
	obj_shop_dialogs.image_index = 6;
	with(obj_shop_dialogs) {
		alarm[1] = room_speed * 1;
	}
}
}
