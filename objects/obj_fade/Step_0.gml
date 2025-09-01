if (fading_out) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        if (target_room != noone) {
            room_goto(target_room);
            fading_out = false;
            fading_in = true;
        }
    }
} else if (fading_in) {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        fading_in = false;
        target_room = noone;
        instance_destroy(); 
    }
}
