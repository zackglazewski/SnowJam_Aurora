/// @description Insert description here
// You can write your code in this editor

script_execute(state);

with (oPortal) {
	image_index = 0;	
}

if (place_meeting(x, y, oPortal)) {
	var portal = instance_place(x, y, oPortal);
	portal.image_index = 1;
	
	if (keyboard_check_pressed(vk_space)) {
		script_execute(portal.trigger_script);	
	}
}
	




