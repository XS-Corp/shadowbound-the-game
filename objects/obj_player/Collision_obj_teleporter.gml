global.playerx = 208;
global.playery = 384;
audio_stop_all();
var fade = instance_create_layer(0, 0, "fade", obj_fade);
fade.fading_out = true;
fade.target_room = prefinal_room;
