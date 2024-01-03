/// @description Insert description here
// You can write your code in this editor

state = playerStatePlatformerFree;

tilemap = layer_tilemap_get_id(layer_get_id("Col"));

external_forces = ds_list_create();
input_acceleration = [0, 0];
jump_impulse = 15;
acceleration_magnitude = 1;
kinetic_friction = 0.5;
air_resistance = 0.1;
static_friction = 0.5;
grav = 1;
max_speed = 7;
terminal_velocity = 20;
hspd = 0;
vspd = 0;


function add_force(_mag, _dir) {
	ds_list_add(external_forces, [_mag, _dir]);
}

function apply_forces() {
	var hacc_accum = 0;
	var vacc_accum = 0;
	
	for (var i = 0; i < ds_list_size(external_forces); i++) {
		var _mag = external_forces[|i][0];
		var _dir = external_forces[|i][1];
		
		hacc_accum += lengthdir_x(_mag, _dir);
		vacc_accum += lengthdir_y(_mag, _dir);
	}
	
	hspd += hacc_accum;
	vspd += vacc_accum;
	
	hspd = clamp(hspd, -1 * max_speed, max_speed);
	if (vspd > terminal_velocity) {
		vspd = terminal_velocity;	
	}
}
