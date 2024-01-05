/// @description Insert description here
// You can write your code in this editor

fishing_pole = oFishingPole;
Camera.follow = id;

hspd = 0;
vspd = 0;

max_fallspeed = 2;

reeled_in = true;

state = hookStateReeled;
tilemap = layer_tilemap_get_id(layer_get_id("Col"));

fish = noone;