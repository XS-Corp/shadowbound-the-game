if (!surface_exists(light_surface)) {
    light_surface = surface_create(room_width, room_height);
}

surface_set_target(light_surface);
draw_clear_alpha(c_dkgray, 1); 

gpu_set_blendmode(bm_normal);

with (obj_light) {
    if (on) {
        draw_sprite_ext(
            spr_light,
            0,
            x, y,
            range / sprite_width,
            range / sprite_height,
            0,
            c_yellow,   
            1       
        );
    }
}

with (obj_unlight) {
    if (on) {
        draw_sprite_ext(
            spr_light, 
            0,
            x, y,
            range / sprite_width,
            range / sprite_height,
            0,
            c_yellow,
            1
        );
    }
}

with (obj_timelight) {
    if (on) {
        draw_sprite_ext(
            spr_light, 
            0,
            x, y,
            range / sprite_width,
            range / sprite_height,
            0,
            c_yellow,
            1
        );
    }
}

with (obj_light_1) {
    if (on) {
        draw_sprite_ext(
            spr_light, 
            0,
            x, y,
            range / sprite_width,
            range / sprite_height,
            0,
            c_white,
            1
        );
    }
}

surface_reset_target();

gpu_set_blendmode_ext(bm_dest_color, bm_zero);
draw_surface(light_surface, 0, 0);
gpu_set_blendmode(bm_normal);
