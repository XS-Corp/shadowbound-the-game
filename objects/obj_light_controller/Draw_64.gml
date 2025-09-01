draw_set_font(biiiig_font);
draw_set_color(c_white); 

if (!global.player_in_light) {
	if (time_left > 0) {
		var seconds = ceil(time_left / room_speed);
		draw_text(20, 20, "Time left: " + string(seconds));
	}
}
