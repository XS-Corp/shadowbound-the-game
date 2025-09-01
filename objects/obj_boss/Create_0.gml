global.hp = 100;
attack_hits = 0;

attack_phase = "none";
next_attack = "none";
warning_timer = 0;
attack_cooldown = 0;
attack_delay = room_speed * 5;

fast_projectiles = [];
slow_projectiles = [];

laser_warning = false;
laser_timer = 0;

side_attack = "";
side_attack_timer_start = 0;
warning_sound_played = false;
