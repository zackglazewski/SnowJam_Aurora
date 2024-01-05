// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gotoMap(){
	global.current_spawn = 1;
	room_goto(rMap);
}

function gotoPolarBear() {
	if (room != rFishing) {
		global.current_spawn = 1;	
	}
	room_goto(rPolarBear);	
	audio_stop_all();
}

function gotoVillage() {
	global.current_spawn = 1;
	room_goto(rVillage);	
}

function gotoFishing() {
	audio_stop_all();
	global.current_spawn = 2;
	room_goto(rFishing);
}
	