if (red_flash) {
    frame_progress = min(frame_progress + frame_speed, 1);
} else {
    frame_progress = max(frame_progress - frame_speed, 0);
}

if (frame_progress >= 1) {
    alarm[0] = room_speed; 
}

if (alarm[0] == 0 && frame_progress > 0) {
    red_flash = false;
}
