// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gotoMap(){
	room_goto(rMap);
}

function gotoPolarBear() {
	room_goto(rPolarBear);	
	audio_stop_all();
}

function gotoVillage() {
	room_goto(rVillage);	
}

function gotoFishing() {
	audio_stop_all();
	room_goto(rFishing);
}
	