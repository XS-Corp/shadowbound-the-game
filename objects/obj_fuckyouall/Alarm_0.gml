global.passed = 6;
save_globals_to_ini("save.ini", "GameData");
var fade = instance_create_layer(0, 0, "fade", obj_fade);
fade.fading_out = true;
fade.target_room = level_complete;
