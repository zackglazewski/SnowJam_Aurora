// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hookStateReeled(){
	
	if (fish != noone) {
		show_debug_message("caught fish!");
		instance_destroy(fish);
		BaitCounter.num_fish++;
		if (BaitCounter.num_fish >= 5) {
			global.polarbear = true;
		}
		fish = noone;
	}
	if (keyboard_check_pressed(vk_space)) && BaitCounter.num_bait > 0 {
		state = hookStateCast;
	} else if (keyboard_check_pressed(vk_space)) && BaitCounter.num_bait <= 0 {
		Dialogue.queue_dialogue("FishingHoleNoBait");	
		state = hookStateRead;
	}
}

function hookStateRead() {
	if (ds_queue_empty(Dialogue.dialogue_queue)) {
		state = hookStateReeled;
	} else if (keyboard_check_pressed(ord("E"))) {
		ds_queue_dequeue(Dialogue.dialogue_queue);		
	}
}
	

function hookStateFishing() {
	
	if (keyboard_check(vk_space)) {
		var dir = point_direction(x, y, oFishingPole.x, oFishingPole.y);
		vspd += lengthdir_y(5, dir);
		hspd += lengthdir_x(5, dir);
	} else {
		var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
		hspd += horizontal_input;
		vspd += 0.2;
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