/// @description Insert description here
// You can write your code in this editor

if (!ds_queue_empty(dialogue_queue)) {
	var message_string = ds_queue_head(dialogue_queue);
	// draw boxes
	draw_set_color(c_ltgrey);
	draw_roundrect_ext(margin, window_get_height() - (margin + height), window_get_width() - margin, window_get_height() - margin, 5, 5, false);
	draw_set_color(c_black);
	draw_roundrect_ext(margin, window_get_height() - (margin + height), window_get_width() - margin, window_get_height() - margin, 5, 5, true);
	// draw text
	
	draw_text_ext(margin + text_margin, window_get_height() - margin - height + text_margin, message_string, 1, window_get_width() - (2 * margin));
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(window_get_width() - margin - text_margin, window_get_height() - margin - text_margin, "press b to stop talking"); 
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
}




