if (global.bought_timestop) {
if (keyboard_check_pressed(ord("C")) && global.can_use_timestop) {
    global.timestop = true;
    global.timestop_timer = room_speed * 5; 
    global.can_use_timestop = false;
    global.cooldown_timer = room_speed * 20;
}

if (global.timestop) {
    global.timestop_timer -= 1;
    if (global.timestop_timer <= 0) {
        global.timestop = false;
    }
} else {
    if (!global.can_use_timestop) {
        global.cooldown_timer -= 1;
        if (global.cooldown_timer <= 0) {
            global.can_use_timestop = true;
        }
    }
}
} else {
	exit;
}
