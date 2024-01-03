// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tilemap_place_meeting(tilemap, _x, _y, _valid_top){
	var xp = x;
	var yp = y;
	x = _x;
	y = _y;
	
	
	var meeting = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) ||
				  tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) ||
				  tilemap_get_at_pixel(tilemap, bbox_left, y) ||
				  tilemap_get_at_pixel(tilemap, bbox_right, y) ||
				  tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) ||
				  tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) ||
				  tilemap_get_at_pixel(tilemap, x, bbox_top) ||
				  tilemap_get_at_pixel(tilemap, x, bbox_bottom) ||
				  tilemap_get_at_pixel(tilemap, x, y);
				  
	if (_valid_top) {
			
	}
				  
	x = xp;
	y = yp;
			
	return meeting;
}