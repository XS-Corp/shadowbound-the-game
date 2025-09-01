if(global.timestop) image_speed = 0; else image_speed = 5;
if(global.timestop) exit;
if (!global.paused) {
var player = instance_nearest(x, y, obj_player);
var dist_to_player = point_distance(x, y, player.x, player.y);

if (global.player_in_light && dist_to_player <= 250) {
    if (!music_playing) {
        audio_play_sound(snd_enemy_detected, 1, true);
        music_playing = true;
    }

	if (player.x > x) {
	    x += chase_speed;
	    sprite_index = spr_enemy_right;
	    dir = 1;
	} else if (player.x < x) {
	    x -= chase_speed;
	    sprite_index = spr_enemy_left;
	    dir = -1;
	}

	if (player.y > y) {
	    y += chase_speed;
	} else if (player.y < y) {
	    y -= chase_speed;
	}

	if (place_meeting(x, y, obj_player)) {
        global.died_in = 2;
		audio_stop_sound(snd_enemy_detected);
		room_goto(died_cutscene);
    }
    
} else {
    if (music_playing) {
        audio_stop_sound(snd_enemy_detected);
        music_playing = false;
    }
    x += walk_speed * dir;
    
    sprite_index = (dir == 1) ? spr_enemy_right : spr_enemy_left;

    if (x >= end_x) {
        dir = -1;
    } else if (x <= start_x) {
        dir = 1;
    }
}
}
