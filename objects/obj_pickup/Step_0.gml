if (keyboard_check_pressed(sequence[seq_pos])) {
    seq_pos++;
    if (seq_pos >= array_length(sequence)) {
        global.picked = 4;
        seq_pos = 0; 
    }
} else if (keyboard_check_pressed(vk_anykey)) {
    if (!keyboard_check_pressed(sequence[seq_pos])) {
        seq_pos = 0;
    }
}
