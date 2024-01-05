// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fishStateWait(){
	
	currentWait--;
	if (currentWait <= 0) {
		currentWait = random_range(30, 240);
		moveDir = random_range(0, 359);
		moveMag = random_range(2, 5);
		moveDuration = random_range(30, 240);
		state = fishStateMove;
	}
	
}

function fishStateMove() {
	moveDuration--;
	hspd = lengthdir_x(moveMag, moveDir);
	vspd = lengthdir_y(moveMag, moveDir);
	
	if (moveDuration <= 0) {
		state = fishStateWait;	
	}
	
	// collide and move
	if (tilemap_place_meeting(tilemap, x + hspd, y, true)) {
		while (!tilemap_place_meeting(tilemap, x + sign(hspd), y, true)) {
			x += sign(hspd);	
		}
		moveDir = point_direction(0, 0, -hspd, vspd);
		hspd = -1 * sign(hspd) * sprite_width;
	}
	
	if (tilemap_place_meeting(tilemap, x, y + vspd, true)) {
		while (!tilemap_place_meeting(tilemap, x, y + sign(vspd), true)) {
			y += sign(vspd);	
		}
		
		moveDir = point_direction(0, 0, hspd, -vspd);
		
		vspd = -1 * sign(vspd) * sprite_width;
	}
	
	image_angle = moveDir;
	x += hspd;
	y += vspd;
	
}

function fishStateHooked() {
	if (hook != noone) {
		x = hook.x;
		y = hook.y + hook.sprite_height;
	}
}