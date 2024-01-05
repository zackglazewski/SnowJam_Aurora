// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sprite_animate(){

	var _totalFrames = (sprite_get_number(sprite_index) / 4);
	//show_debug_message("localFrame: " + string(localFrame));
	image_index = localFrame + (round(direction/90) * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / 60;
	
	//if animation would loop on next game step
	if (localFrame >= _totalFrames) {
		animationEnd = true;
		localFrame -= _totalFrames;
		localFrame = 0;
		return true;
	} else {
		animationEnd = false;
		return false;
		
	}
	
}