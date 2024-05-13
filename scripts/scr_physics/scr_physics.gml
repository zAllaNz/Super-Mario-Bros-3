///@description Função para fazer a colisão e física do player.
///@function player_physics();
function player_physics(){
	//h_speed = (key_right - key_left) * walk_speed; //Mover horizontalmente
	move_x = arrow_pressed();
	if (move_x != 0) {
		h_speed += move_x * acel;
	}
	else
	{
		if(h_speed != 0) { // se não tiver nenhuma tecla apertada e se tiver ainda velocidade
	        var dir = sign(h_speed);
	        h_speed -= dir * decel;
			if(on_slope()){
				var slope = slope_up(h_speed);
				if(slope){
					h_speed = 0;
				}
			}
	        else if (dir != sign(h_speed)) {
	            h_speed = 0;
	        }
		}
	}
	h_speed = clamp(h_speed, -vel, vel);
	v_speed += grav;							   //Mover verticalmente
	on_ground = place_meeting(x,y+2,obj_ground);   //Detectar se o player está tocando no chão
	//Move and collide horizontal
	var _hCol = move_and_collide(h_speed, 0, obj_ground, abs(vel));
	//Descendo nas rampas
	if (on_ground) && (place_meeting(x,y + abs(h_speed) + 1 ,obj_ground)) && (v_speed >= 0)
	{   
	    v_speed += abs(h_speed) + 1;
	}
	//Move and collide vertical
	var _vCol = move_and_collide(0, v_speed, obj_ground, abs(v_speed)+1 , h_speed, v_speed, h_speed, v_speed);
	if (array_length(_vCol)  > 0)
	{
	    v_speed = 0;
	}
}

function arrow_pressed(){
	return key_right - key_left
}

///@description Função para fazer o player saltar.
///@function player_jump();
function player_jump(){
	if (key_jump and on_ground)
	{
	    v_speed = jump_speed;
	}
}

///@description Função para inverter a imagem_xscale da sprite do player.
///@function inverter_ximagem();
function inverter_ximagem() {
	if(h_speed != 0){
		image_xscale = sign(h_speed);
	}
}

///@description Função para detectar se o player tem colisão com um slope.
///@function on_slope();
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
