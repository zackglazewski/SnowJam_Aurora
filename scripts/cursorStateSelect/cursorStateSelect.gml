// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cursorStateSelect(){
	// get inputs
	var input_horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var input_vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	var input_direction = point_direction(0, 0, input_horizontal, input_vertical);
	var input_interact = keyboard_check_pressed(ord("E"));
	
	
	// update speeds
	hspd = lengthdir_x(abs(input_horizontal) * move_speed, input_direction);
	vspd = lengthdir_y(abs(input_vertical) * move_speed, input_direction);
	
	
	x += hspd;
	y += vspd;
}