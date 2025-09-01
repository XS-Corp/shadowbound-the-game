if (!global.stole_item) {
audio_stop_all();
audio_play_sound(snd_shop, 1, true);
var fade = instance_create_layer(0, 0, "fade", obj_fade);
fade.fading_out = true;
fade.target_room = shop;
} else {
	if (!nope_played) {
		audio_play_sound(snd_nope, 1, false)
		nope_played = true
	}
}
