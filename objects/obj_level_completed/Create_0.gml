audio_play_sound(snd_completed, 0.5, false);
alarm[0] = room_speed * 5;
global.shadowcoins += 1;
save_globals_to_ini("save.ini", "GameData");
