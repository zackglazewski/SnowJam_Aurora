/// @description Insert description here
// You can write your code in this editor

if (room == rFishing) || (room == rPolarBear) 
{
	draw_set_color(c_black);
	draw_text(100, 100, "Bait Found: " + string(num_bait));
	draw_text(100, 150, "Fish Caught: " + string(num_fish));
	draw_set_color(c_white);
}



