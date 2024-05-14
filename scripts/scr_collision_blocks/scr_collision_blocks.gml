///@description Função para detectar se o player tem colisão com um slope.
///@function on_slope(), [colocar em outro script posteriormente];
function on_slope(){
	return place_meeting(x,y+2,obj_ground_slope_1);
}

///@description Função para detectar se o player está subindo.
///@function on_slope() retorna 1 para direita e -1 para esquerda;
function slope_up(vel){
	var slope = instance_place(x,y+2,obj_ground_slope_1);
	if(slope.image_xscale == sign(vel)){
		return true;
	}
	return false;
}

function on_screen(objeto){
	var screen_left = camera_get_view_x(view_camera[0]);
    var screen_right = screen_left + camera_get_view_width(view_camera[0]);
	if(number_in_range(objeto.x, screen_left, screen_right)){
		return true;
	}
}

function number_in_range(num, min, max){
	return num >= min and num <= max
}