// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateFish(){
	direction = 0;
	sprite_index = sPlayerIdle;
	sprite_animate();
}

function playerDrawStateFish() {
	draw_self();
}