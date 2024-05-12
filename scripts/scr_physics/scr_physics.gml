 ///@description Função para fazer a colisão e física do player.
///@function player_physics();
function player_physics(){
	/*
	h_speed = (key_right - key_left) * walk_speed; //Mover horizontalmente
	*/
	
////////////////////// TESTE DE FÍSICA
	move_x = key_right - key_left;
	if (move_x != 0) {
		h_speed += move_x * acel;
	}
	else
	{
		if (h_speed != 0) {
	        var dir = sign(h_speed);
	        h_speed -= dir * decel;
	        if (dir != sign(h_speed)) {
	            h_speed = 0;
	        }
		}
	}
	h_speed = clamp(h_speed, -max_speed, max_speed);

//////////////////////////
	v_speed += grav;							   //Mover verticalmente
	on_ground = place_meeting(x,y+2,obj_ground);   //Detectar se o player está tocando no chão
	//Move and collide horizontal
	var _hCol = move_and_collide(h_speed, 0, obj_ground, abs(h_speed)) 
	//Descendo nas rampas
	if (on_ground) && (place_meeting(x,y + abs(h_speed) + 1 ,obj_ground)) && (v_speed >= 0)
	{   
	    v_speed += abs(h_speed) + 1;
	}
	//Move and collide vertical
	var _vCol = move_and_collide(0, v_speed, obj_ground, abs(v_speed)+1 , h_speed, v_speed, h_speed, v_speed)
	if (array_length(_vCol)  > 0)
	{
	    v_speed = 0;
	}
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
function inverter_ximagem(_dir, _esq) {
	if(h_speed != 0){
		image_xscale = (_dir - _esq);
	}
}
