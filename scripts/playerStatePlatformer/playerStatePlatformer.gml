// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStatePlatformerFree(){
	// get inputs
	var input_horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var input_jump = keyboard_check_pressed(vk_space);
	
	// gravity
	add_force(grav, 270);
	
	// add input force
	show_debug_message(string(darccos(input_horizontal)));
	add_force(abs(input_horizontal * acceleration_magnitude), darccos(input_horizontal));
	
	if (input_jump && tilemap_place_meeting(tilemap, x, y+1)) {
		add_force(jump_impulse, 90);	
	}
	
	// update friction
	if (abs(hspd) > static_friction) {
		if (!tilemap_place_meeting(tilemap, x, y+1)) {
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
	
	if (tilemap_place_meeting(tilemap, x + hspd, y)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y)) {
			x += sign(hspd);	
		}
		hspd = 0;
	}
	
	if (tilemap_place_meeting(tilemap, x, y + vspd)) {
		while (!tilemap_place_meeting(tilemap, x, y + sign(vspd))) {
			y += sign(vspd);	
		}
		vspd = 0;
	}
	
	if (tilemap_place_meeting(tilemap, x + hspd, y + vspd)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y + vspd)) {
			x += sign(hspd);	
		}
		hspd = 0;	
	}
	
	x += hspd;
	y += vspd;
	
	
	ds_list_clear(external_forces);
}