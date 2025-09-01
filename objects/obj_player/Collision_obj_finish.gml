global.passed += 1;
instance_destroy(obj_finish);
save_globals_to_ini("save.ini", "GameData");
audio_stop_sound(snd_bg);
audio_play_sound(snd_completed, 0.5, false);
audio_play_sound(snd_welcome_to_shadowbound, 1, true);
x = 395;
y = 410;
