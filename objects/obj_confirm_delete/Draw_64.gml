draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(center_x, center_y - 60, question);

draw_set_color(c_lime);
draw_rectangle(btn_yes_x, btn_yes_y, btn_yes_x + btn_width, btn_yes_y + btn_height, false);
draw_set_color(c_black);
draw_text(btn_yes_x + btn_width / 2, btn_yes_y + btn_height / 2, "Yes");

draw_set_color(c_red);
draw_rectangle(btn_no_x, btn_no_y, btn_no_x + btn_width, btn_no_y + btn_height, false);
draw_set_color(c_white);
draw_text(btn_no_x + btn_width / 2, btn_no_y + btn_height / 2, "No");
