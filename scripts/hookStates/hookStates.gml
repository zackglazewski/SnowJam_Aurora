// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hookStateReeled(){
	
	if (fish != noone) {
		show_debug_message("caught fish!");
		instance_destroy(fish);
		fish = noone;
	}
	if (keyboard_check_pressed(vk_space)) {
		state = hookStateCast;
	}
}

function hookStateFishing() {
	
	if (keyboard_check(vk_space)) {
		var dir = point_direction(x, y, oFishingPole.x, oFishingPole.y);
		vspd += lengthdir_y(3, dir);
		hspd += lengthdir_x(3, dir);
	} else {
		var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
		hspd += horizontal_input;
		vspd += 0.1;
		vspd = clamp(vspd, 0, max_fallspeed);
	}
	
	hspd = clamp(hspd, -1, 1);
	vspd = clamp(vspd, -max_fallspeed, max_fallspeed);
	
	if (tilemap_place_meeting(tilemap, x + hspd, y, true)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y, true)) {
			x += sign(hspd);	
		}
		hspd = 0;
	}
	
	if (tilemap_place_meeting(tilemap, x, y + vspd, true)) {
		while (!tilemap_place_meeting(tilemap, x, y + sign(vspd), true)) {
			y += sign(vspd);	
		}
		vspd = 0;
	}
	
	x += hspd;
	y += vspd;
	
	hspd = 0;
	
	if (point_distance(x, y, oFishingPole.x, oFishingPole.y) <= 5) {
		x = xstart;
		y = ystart;
		state = hookStateReeled;
	}
}

function hookStateCast() {
	y += 1;
	if (point_distance(x, y, oFishingPole.x, oFishingPole.y) > 10) {
		state = hookStateFishing; 	
	}
}