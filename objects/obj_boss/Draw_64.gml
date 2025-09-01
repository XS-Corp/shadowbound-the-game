var bar_width = 220;
var bar_height = 24;
var padding = 20;
var gui_w = display_get_gui_width();
var font_to_use = warning_font;

var max_hits_player = 10;
var current_hits_player = clamp(attack_hits, 0, max_hits_player);
var percent_player = 1 - (current_hits_player / max_hits_player);
var x_player = gui_w - padding - bar_width;
var y_player = padding + 20;

draw_set_color(make_color_rgb(40, 40, 40));
draw_rectangle(x_player, y_player, x_player + bar_width, y_player + bar_height, false);

draw_set_color(c_white);
for (var i = 0; i < 10; i++) {
    draw_rectangle(x_player - i, y_player - i, x_player + bar_width + i, y_player + bar_height + i, false);
}

draw_set_color(c_red);
draw_rectangle(x_player, y_player, x_player + bar_width * percent_player, y_player + bar_height, true);

draw_set_font(font_to_use);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(x_player - 15, y_player + bar_height / 2, "Player");

var max_hits_boss = 100;
var current_hits_boss = clamp(global.hp, 0, max_hits_boss);
var percent_boss = current_hits_boss / max_hits_boss;
var x_boss = gui_w - padding - bar_width;
var y_boss = y_player + bar_height + 40;

draw_set_color(make_color_rgb(40, 40, 40));
draw_rectangle(x_boss, y_boss, x_boss + bar_width, y_boss + bar_height, false);

draw_set_color(c_white);
for (var i = 0; i < 10; i++) {
    draw_rectangle(x_boss - i, y_boss - i, x_boss + bar_width + i, y_boss + bar_height + i, false);
}

draw_set_color(c_green);
draw_rectangle(x_boss, y_boss, x_boss + bar_width * percent_boss, y_boss + bar_height, true);

draw_set_font(font_to_use);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(x_boss - 15, y_boss + bar_height / 2, "Boss");
