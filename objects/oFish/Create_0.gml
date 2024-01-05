/// @description Insert description here
// You can write your code in this editor
state = fishStateWait;
localFrame = 0;
image_speed = 1;
direction = 0;

hook = noone;

currentWait = 30;
totalWait = 0;
moveDir = 0;
moveMag = 0;
moveDuration = 0;
currentMove = 0;

tilemap = layer_tilemap_get_id(layer_get_id("Col"));