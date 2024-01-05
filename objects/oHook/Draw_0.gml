/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_color(c_black);
draw_line(x, y, oFishingPole.x, oFishingPole.y);
//show_debug_message(string(oFishingPole.x) + ", " + string(oFishingPole.y));
//draw_text(x + 10, y + 10, "fishing_pole.x: " + string(fishing_pole));
draw_set_color(c_white);


if (fish == noone) {
	draw_sprite(sBait, 0, x, y + sprite_height);
}
