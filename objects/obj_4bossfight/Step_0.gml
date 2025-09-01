if (!global.paused) {
time_passed += 1;

if (time_passed >= 10 * room_speed) {
    time_passed = 0;
    var r = irandom_range(1, 5);
    if (r == 1) {
        blinking = true;
        blink_timer = 0;
        blink_elapsed = 0;
        executed = false;
    }
}

if (blinking) {
    blink_timer += 1;
    blink_elapsed += 1;
	shake_time = 30; 
	shake_strength = 5; 


    if (blink_timer >= blink_interval) {
        blink_timer = 0;
        with (obj_light)     on = !on;
        with (obj_unlight)   on = !on;
        with (obj_timelight) on = !on;
    }

    if (blink_elapsed >= blink_duration) {
        blinking = false;
		shake_strength = 10;
        with (obj_light)     on = true;
        with (obj_unlight)   on = true;
        with (obj_timelight) on = true;

        fade_timer = room_speed; 
    }
}

if (fade_timer > 0) {
    fade_timer -= 1;
    if (fade_timer <= 0 && !executed) {
        executed = true;
        instance_create_layer(0, 0, "GUI", obj_screen_fade);
        if (!global.player_hidden) {
            room_restart();
        }
    }
}
}
