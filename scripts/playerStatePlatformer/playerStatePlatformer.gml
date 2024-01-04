// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStatePlatformerFree(){
	// get inputs
	var input_horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var input_jump = keyboard_check_pressed(vk_space);
	
	var input_interact = keyboard_check_pressed(ord("E"));

	if (input_interact) {
		with (oFriend) {
			if (point_distance(x, y, other.x, other.y) < 64) {
				other.dialogue_key = character_key;	
			}
		}
		if (dialogue_key != -1) {
			Dialogue.queue_dialogue(dialogue_key);
			previousState = playerStatePlatformerFree;
			state = playerStateTalk;
			return;
		}
	}
	
	// gravity
	add_force(grav, 270);
	
	// add input force
	show_debug_message(string(darccos(input_horizontal)));
	add_force(abs(input_horizontal * acceleration_magnitude), darccos(input_horizontal));
	
	if (input_jump && tilemap_place_meeting(tilemap, x, y+1, true)) {
		add_force(jump_impulse, 90);	
	}
	
	// update friction
	if (abs(hspd) > static_friction) {
		if (!tilemap_place_meeting(tilemap, x, y+1, true)) {
			add_force(air_resistance * abs(hspd), darccos(sign(hspd)) + 180);
		} else {
			add_force(kinetic_friction, darccos(sign(hspd)) + 180);
		}
	} else {
		hspd = 0;	
	}
	
	// update speed
	apply_forces();
	
	
	// collide and move
	
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
	
	if (tilemap_place_meeting(tilemap, x + hspd, y + vspd, true)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y + vspd, true)) {
			x += sign(hspd);	
		}
		hspd = 0;	
	}
	
	x += hspd;
	y += vspd;
	
	
	ds_list_clear(external_forces);
}