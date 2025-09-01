if (keyboard_check_pressed(vk_escape)) {
	audio_pause_all();
	global.paused = !global.paused
}

if (global.paused && played = false) {
	audio_play_sound(snd_paused, 1, true);
	played = true
} else {
	audio_stop_sound(snd_paused);
	played = false
	audio_resume_all();
}
