if (fade_in) {
    alpha += 0.05;
    if (alpha >= 1) {
        alpha = 1;
        fade_in = false;
        timer = room_speed * 2; 
    }
} else {
    timer -= 1;
    if (timer <= 0) {
        instance_destroy(); 
    }
}
