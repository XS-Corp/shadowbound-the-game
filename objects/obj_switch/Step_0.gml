if (linked_light == noone) {
    linked_light = instance_nearest(x, y, obj_light);
    if (linked_light != noone && point_distance(x, y, linked_light.x, linked_light.y) > range) {
        linked_light = noone; 
    }
}
