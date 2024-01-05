// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateFish(){
	direction = 0;
	sprite_index = sPlayerIdle;
	sprite_animate();
	
	if (keyboard_check_pressed(ord("B"))) {
		ds_queue_clear(Dialogue.dialogue_queue);
		gotoPolarBear();
	}
}

function playerDrawStateFish() {
	draw_self();
}