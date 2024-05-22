function enemys_physics(v_speed, walk_speed, grav, on_ground){
	var h_speed = walk_speed; //Mover horizontalmente
	v_speed += grav;	
	on_ground = place_meeting(x,y+2,obj_ground);   //Detectar se o player está tocando no chão
	//Move and collide horizontal
	var _hCol = move_and_collide(h_speed, 0, obj_ground, abs(walk_speed));
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
	return v_speed
}

function player_hit(objeto){
	if(!obj_player.iframe){
		if(place_meeting(objeto.x,objeto.y,obj_player)){
			global.game_paused = true;
			obj_player.hp--;
			obj_player.iframe = true;
		}
	}
}

function enemy_destroy(contagem, count_max){
	if(contagem > count_max){
		instance_destroy();
	}
}