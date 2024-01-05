/// @description Insert description here
// You can write your code in this editor


if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
} else {
	xTo = x;
	yTo = y;
}

x += (xTo - x) / easeSpeed;
y += (yTo - y) / easeSpeed;

x = clamp(x, view_width_half, room_width - view_width_half);
y = clamp(y, view_height_half, room_height - view_height_half);

//screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_width_half, y - view_height_half);






