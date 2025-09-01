if(global.timestop) image_speed = 0; else image_speed = 3;
if(global.timestop) exit;

// --- Выбор атаки и предупреждение ---
if (attack_phase == "none" && warning_timer <= 0 && attack_cooldown <= 0) {
    next_attack = choose("fast", "slow", "laser", "minion", "side");
    warning_timer = room_speed * 2; // 1 секунда предупреждения

    var wx = obj_player.x;
    var wy = obj_player.y;

    switch (next_attack) {
        case "fast": show_warning("!!", wx, wy); break;
        case "slow": show_warning("!", wx, wy); break;
        case "laser": show_warning("!!!", x, room_height / 2); break;
        case "minion": show_warning("!!!", wx, wy); break;
        case "side":
            side_attack = choose("left", "right");
            show_warning("!!!!", side_attack == "left" ? 64 : room_width - 64, room_height / 2);
            break;
    }
}
// --- Таймер предупреждения ---
else if (warning_timer > 0) {
	if (!warning_sound_played){
		audio_play_sound(snd_atack_warning, 0.5, false)
		warning_sound_played = true
	}
    warning_timer--;

    if (warning_timer == 0) {
		warning_sound_played = false;
        attack_phase = next_attack;
        attack_cooldown = attack_delay;
        next_attack = "none";

        switch (attack_phase) {
            case "fast":
                var p_fast = {
                    x: x, y: y,
                    dir: point_direction(x, y, obj_player.x, obj_player.y),
                    timer: room_speed * 10
                };
                array_push(fast_projectiles, p_fast);
                break;

            case "slow":
                var p_slow = {
                    x: x, y: y,
                    angle: point_direction(x, y, obj_player.x, obj_player.y),
                    timer: room_speed * 10
                };
                array_push(slow_projectiles, p_slow);
                break;

            case "laser":
                laser_warning = true;
                laser_timer = room_speed;
                break;

            case "minion":
                var mx = obj_player.x;
                var my = obj_player.y;
                instance_create_layer(mx + 480, my, "Instances", obj_enemy_2);
                instance_create_layer(mx - 480, my, "Instances", obj_enemy_2);
                break;

            case "side":
                side_attack_timer_start = room_speed;
                break;
        }
    }
}
// --- Таймер атаки ---
else {
    if (attack_cooldown > 0) attack_cooldown--;
    else attack_phase = "none";
}

// --- Обработка fast_projectiles ---
var sw_fast = sprite_get_width(spr_smth_4);
var sh_fast = sprite_get_height(spr_smth_4);

for (var i = array_length(fast_projectiles) - 1; i >= 0; i--) {
    var f = fast_projectiles[i];
    f.x += lengthdir_x(12, f.dir);
    f.y += lengthdir_y(12, f.dir);
    f.timer--;

    var left = f.x - sw_fast / 2;
    var right = f.x + sw_fast / 2;
    var top = f.y - sh_fast / 2;
    var bottom = f.y + sh_fast / 2;

    if (collision_rectangle(left, top, right, bottom, obj_player, false, true)) {
        with (obj_damage_got) {
			red_flash = true;
			frame_progress = 0;
		}
		attack_hits++;
        if (attack_hits >= 10) {
            global.died_in = 3;
            room_goto(died_1);
        }
        array_delete(fast_projectiles, i, 1);
        continue;
    }
    if (f.timer <= 0) array_delete(fast_projectiles, i, 1);
    else fast_projectiles[i] = f;
}

// --- Обработка slow_projectiles ---
var sw_slow = sprite_get_width(spr_smth_3);
var sh_slow = sprite_get_height(spr_smth_3);

for (var i = array_length(slow_projectiles) - 1; i >= 0; i--) {
    var p = slow_projectiles[i];
    var angle_to_player = point_direction(p.x, p.y, obj_player.x, obj_player.y);
    p.angle = lerp(p.angle, angle_to_player, 0.05);
    p.x += lengthdir_x(3, p.angle);
    p.y += lengthdir_y(3, p.angle);
    p.timer--;

    var left = p.x - sw_slow / 2;
    var right = p.x + sw_slow / 2;
    var top = p.y - sh_slow / 2;
    var bottom = p.y + sh_slow / 2;

    if (collision_rectangle(left, top, right, bottom, obj_player, false, true)) {
        with (obj_damage_got) {
			game_end();
		}
		attack_hits++;
        if (attack_hits >= 10) {
            global.died_in = 3;
            room_goto(died_1);
        }
        array_delete(slow_projectiles, i, 1);
        continue;
    }
    if (p.timer <= 0) array_delete(slow_projectiles, i, 1);
    else slow_projectiles[i] = p;
}

// --- Обработка лазерной атаки ---
if (laser_warning) {
    laser_timer--;
    if (laser_timer <= 0) {
        laser_warning = false;
        if (obj_player.x > x - 192 && obj_player.x < x + 192 && !global.player_hidden) {
            with (obj_damage_got) {
				game_end();
			}
			attack_hits++;
            if (attack_hits >= 10) {
                global.died_in = 3;
                room_goto(died_1);
            }
        }
    }
}

// --- Обработка боковой атаки ---
if (side_attack_timer_start > 0) {
    side_attack_timer_start--;
    if (side_attack_timer_start == 0) {
        if (side_attack == "left" && obj_player.x < room_width / 2 && !global.player_hidden) {
			with (obj_damage_got) {
				red_flash = true;
				frame_progress = 0;
			}
			attack_hits++;
            if (attack_hits >= 10) {
                global.died_in = 3;
                room_goto(died_1);
            }
        }
        if (side_attack == "right" && obj_player.x > room_width / 2 && !global.player_hidden) {
            with (obj_damage_got) {
				red_flash = true;
				frame_progress = 0;
			}
			attack_hits++;
            if (attack_hits >= 10) {
                global.died_in = 3;
                room_goto(died_1);
            }
        }
    }
}

// --- Проверка смерти босса ---
if (global.hp <= 0) {
    audio_stop_all();
    var fade = instance_create_layer(0, 0, "Instances", obj_fade);
    fade.fading_out = true;
    fade.target_room = boss_died_cutscene;
}
