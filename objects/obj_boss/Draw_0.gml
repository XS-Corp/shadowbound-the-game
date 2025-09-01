for (var i = 0; i < array_length(fast_projectiles); i++) {
    var p = fast_projectiles[i];
    draw_sprite(spr_smth_4, 0, p.x, p.y);
}

for (var i = 0; i < array_length(slow_projectiles); i++) {
    var p = slow_projectiles[i];
    draw_sprite(spr_smth_3, 0, p.x, p.y);
}

if (laser_warning) {
    draw_set_alpha(0.6);
    draw_set_color(c_red);
    draw_rectangle(x - 192, 0, x + 192, room_height, false);
    draw_set_alpha(1);
}

if (side_attack_timer_start > 0) {
    draw_set_alpha(0.6);
    draw_set_color(c_red);
    if (side_attack == "left") {
        draw_rectangle(0, 0, room_width / 2, room_height, false);
    } else {
        draw_rectangle(room_width / 2, 0, room_width, room_height, false);
    }
    draw_set_alpha(1);
}
