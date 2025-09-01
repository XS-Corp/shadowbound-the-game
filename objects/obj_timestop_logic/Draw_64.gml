draw_set_font(warning_font);

var status_text;
var status_color;

if (!global.can_use_timestop) {
    status_text = "Wait";
    status_color = c_red;
} else if (global.timestop) {
    status_text = "Stopped";
    status_color = c_yellow;
} else {
    status_text = "Ready";
    status_color = c_green;
}

if (global.bought_timestop) {
draw_set_color(status_color);
draw_text(10, 190, status_text);
draw_set_color(c_white); // чтобы не сломать цвета в дальнейшем
} else {
	// тишина...
}
