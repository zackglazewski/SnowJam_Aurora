// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateTopDownFree(){

	// get inputs
	var input_horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var input_vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	var input_direction = point_direction(0, 0, input_horizontal, input_vertical);
	var input_interact = keyboard_check_pressed(ord("E"));
	
	if (input_interact) {
		with (oFriend) {
			if (point_distance(x, y, other.x, other.y) < 64) {
				other.dialogue_key = character_key;	
			}
		}
		if (dialogue_key != -1) {
			Dialogue.queue_dialogue(dialogue_key);
			previousState = playerStateTopDownFree;
			state = playerStateTalk;
			return;
		}
	}
	
	// update speeds
	hspd = lengthdir_x(abs(input_horizontal) * move_speed, input_direction);
	vspd = lengthdir_y(abs(input_vertical) * move_speed, input_direction);
	
	// collide and move
	if (tilemap_place_meeting(tilemap, x + hspd, y, false)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y, false)) {
			x += sign(hspd);	
		}
		hspd = 0;
	}
	
	if (tilemap_place_meeting(tilemap, x, y + vspd, false)) {
		while (!tilemap_place_meeting(tilemap, x, y + sign(vspd), false)) {
			y += sign(vspd);	
		}
		vspd = 0;
	}
	
	
	x += hspd;
	y += vspd;
	
}