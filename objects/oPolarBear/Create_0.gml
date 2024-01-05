/// @description Insert description here
// You can write your code in this editor







// Inherit the parent event
event_inherited();

if (room == rVillage) {
	character_key = "polarbear_village";	
	if (!global.polarbear) {
		instance_destroy();	
	}
} else if (global.polarbear) {
	character_key = "polarbear_after";
} else {
	character_key = "polarbear_before";	
}
		
