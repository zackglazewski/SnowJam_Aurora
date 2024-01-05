// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateTalk(){
	show_debug_message("character key: " + string(dialogue_key));
	sprite_animate();
	
	if (keyboard_check_pressed(ord("E"))) {
		ds_queue_dequeue(Dialogue.dialogue_queue);
		
		if (ds_queue_empty(Dialogue.dialogue_queue)) {
			dialogue_key = -1;
			state = previousState;
			return;
		}
	}
	
	if (keyboard_check_pressed(ord("B"))) {
		ds_queue_clear(Dialogue.dialogue_queue);
		dialogue_key = -1;
		state = previousState;
		return;
	}
	
}