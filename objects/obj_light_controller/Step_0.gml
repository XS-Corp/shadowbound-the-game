if (surface_exists(global.light_surface)) {
    var px = clamp(obj_player.x, 0, surface_get_width(global.light_surface)-1);
    var py = clamp(obj_player.y, 0, surface_get_height(global.light_surface)-1);
    var col = surface_getpixel(global.light_surface, px, py);
	var val = color_get_value(col);
	show_debug_message("Blue at player pos: " + string(color_get_value(col)) + " | In light: " + string(global.player_in_light));
    global.player_in_light = (val > 125);
}

if (!global.player_in_light) {
    if (time_left > 0) {
        time_left -= 1;
        if (time_left <= 0) {
            audio_stop_sound(snd_your_nigtmare);
            room_restart();
        }
    }
} else {
    time_left = global.bought_ltime ? 15 * room_speed : 10 * room_speed;
}

light_surface = global.light_surface;
