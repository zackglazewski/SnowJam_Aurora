/// @description Insert description here
// You can write your code in this editor

cam = view_camera[0];

view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;

//follow = global.currentPlayer;
follow = noone;

xTo = xstart;
yTo = ystart;

easeSpeed = 15;



shake_length = 0; // 1 second of shaking
shake_magnitude = 0; // max amount of shake
shake_remain = 0; //how much shake left
buff = 16; //buffer, make sure camera doesn't shake outside of room;\





