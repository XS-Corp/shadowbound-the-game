if (!gamepad_is_connected(0)) {
x = mouse_x;
y = mouse_y;
} else
{
var r_x = gamepad_axis_value(0, gp_axisrh);
var r_y = gamepad_axis_value(0, gp_axisrv);

var deadzone = 0.2;
if (abs(r_x) < deadzone) r_x = 0;
if (abs(r_y) < deadzone) r_y = 0;

var cursor_speed = 10;

x += r_x * cursor_speed;
y += r_y * cursor_speed;

x = clamp(x, camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]));
y = clamp(y, camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
}
