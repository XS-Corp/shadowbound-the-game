global.light_surface = surface_create(room_width, room_height);
global.player_in_light = false;
if (!global.bought_ltime) {
time_left = 10 * room_speed;
} else {
	time_left = 15 * room_speed;
}
light_surface = surface_create(room_width, room_height);
