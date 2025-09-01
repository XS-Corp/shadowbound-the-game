if (linked_light != noone && linked_light.on) {
    draw_sprite(spr_lamp_on, 0, x, y);
} else {
    draw_sprite(spr_lamp_off, 0, x, y);
}
