global.playerx = 208;
global.playery = 384;
audio_play_sound(snd_bossfight, 1, true);
instance_destroy(obj_teleporter_1);
var fade = instance_create_layer(0, 0, "fade", obj_fade);
fade.fading_out = true;
fade.target_room = final_cutscene;
