audio_stop_sound(snd_welcome_to_shadowbound);
if (global.passed == 0) {
	global.playertpx = 7692;
	global.playertpy = 1701;
	audio_play_sound(snd_bg, 1, true);
	instance_destroy(obj_goto_game);
	var fade = instance_create_layer(0, 0, "fade", obj_fade);
	fade.fading_out = true;
	fade.target_room = game1;
} else if (global.passed == 1) {
	global.playertpx = 2226;
	global.playertpy = 2252;
	audio_play_sound(snd_bg, 1, true);
	instance_destroy(obj_goto_game);
	var fade = instance_create_layer(0, 0, "fade", obj_fade);
	fade.fading_out = true;
	fade.target_room = game1;
} else if (global.passed == 2) {
	audio_play_sound(snd_bg, 1, true);
	instance_destroy(obj_goto_game);
	var fade = instance_create_layer(0, 0, "fade", obj_fade);
	fade.fading_out = true;
	fade.target_room = game3;
} else if (global.passed == 3) {
	audio_play_sound(snd_bg, 1, true);
	instance_destroy(obj_goto_game);
	var fade = instance_create_layer(0, 0, "fade", obj_fade);
	fade.fading_out = true;
	fade.target_room = game4;
} else if (global.passed == 4) {
	global.playerx = 3789;
	global.playery = 2698;
	var fade = instance_create_layer(0, 0, "fade", obj_fade);
	fade.fading_out = true;
	fade.target_room = game5;
} else if (global.passed == 5) {
	instance_destroy(obj_goto_game);
} else if (global.passed == 6) {
	room_goto(delete_save)
}
