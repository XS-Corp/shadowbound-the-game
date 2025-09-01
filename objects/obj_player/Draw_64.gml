var x_pos = 10;
var y_pos = 100;

draw_set_font(warning_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (global.bought_sprint) {
if (is_sprinting) {
    draw_set_color(c_yellow);
    draw_text(x_pos, y_pos, "Sprinting");
} else if (cooldown_timer > 0) {
    draw_set_color(c_red);
    draw_text(x_pos, y_pos, "Wait...");
} else {
    draw_set_color(c_lime);
    draw_text(x_pos, y_pos, "Ready");
}
}
