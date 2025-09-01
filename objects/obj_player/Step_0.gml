if (global.bought_sprint) {
if (!is_sprinting && cooldown_timer <= 0 && keyboard_check(vk_space)) {
    is_sprinting = true;
    sprint_timer = sprint_duration;
    move_speed = 8;
} 

if (is_sprinting) {
    sprint_timer--;
    if (sprint_timer <= 0) {
        is_sprinting = false;
        cooldown_timer = sprint_cooldown;
        move_speed = 4;
    }
} else {
    if (cooldown_timer > 0) {
        cooldown_timer--;
    }
    if (cooldown_timer <= 0) {
        move_speed = 4;
    }
}
}

var dt = delta_time / 1000000; 
var dist = move_speed * dt * room_speed;    

if (global.player_in_light && !global.paused) {
    var in_x = (keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) ? 1 : 0) 
             - (keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) ? 1 : 0);

	var in_y = (keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) ? 1 : 0) 
			 - (keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu) ? 1 : 0);

    var dx = in_x * dist;
    var dy = in_y * dist;

    if (dx != 0 && dy != 0) {
        var len = sqrt(dx*dx + dy*dy);
        dx = dx / len * dist;
        dy = dy / len * dist;
    }

    if (!place_meeting(x + dx, y + dy, obj_solid_parent)) {
        x += dx;
        y += dy;
    } else {
        if (!place_meeting(x + dx, y, obj_solid_parent)) x += dx;
        if (!place_meeting(x, y + dy, obj_solid_parent)) y += dy;
    }

    if (abs(dx) > abs(dy)) {
        sprite_index = (dx > 0) ? spr_player_right : spr_player_left;
    } else if (dy != 0) {
        sprite_index = (dy > 0) ? spr_player_down : spr_player_up;
    }
} else {
	// ничего блять тут не делаем
}
