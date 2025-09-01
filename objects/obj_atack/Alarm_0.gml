var side = choose("left", "right");
var spawn_x = (side == "left") ? 0 : room_width;
var spawn_y = irandom_range(100, room_height - 100); 

instance_create_layer(spawn_x, spawn_y, "Instances", obj_atack);

alarm[0] = room_speed * 10;
