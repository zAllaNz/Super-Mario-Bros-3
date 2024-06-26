///@description Função para fazer a colisão e física do player.
///@function player_physics();
function player_physics(){
	if(!global.game_paused){
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
		on_ground = place_meeting(x,y+2,collision_blocks);   //Detectar se o player está tocando no chão
		//Move and collide horizontal
		var _hCol = move_and_collide(h_speed, 0, collision_blocks, abs(vel));
		//Descendo nas rampas
		if (on_ground) && (place_meeting(x,y + abs(h_speed) + 1 ,obj_ground)) && (v_speed >= 0)
		{   
		    v_speed += abs(h_speed) + 1;
		}
		//Move and collide vertical
		var _vCol = move_and_collide(0, v_speed, collision_blocks, abs(v_speed)+1 , h_speed, v_speed, h_speed, v_speed);
		if (array_length(_vCol)  > 0)
		{
		    v_speed = 0;
		}
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

///@description Função para controlar o medidor p do player.
///@function o medidor aumenta quando o player corre, e com o medidor no máximo a velocidade é incrementada;
function p_meter_control(estado){
	if(key_run and arrow_pressed() != 0){
		if(estado != character_state.running and !p_meter_on){
			p_meter = max(p_meter-0.5,0);
		}
		else{
			p_meter = min(p_meter+1, max_p_meter);
		}
		if(p_meter == max_p_meter){
			if(!p_meter_on){
				p_meter_on = true;
				jump_speed = -6.5;
			}
			else{
				p_meter_timer = min(p_meter_timer+1, p_meter_wait);
				if(p_meter_timer >= p_meter_wait){   
					p_meter_on = false;
					jump_speed = -5.3;
					p_meter = 0;
					p_meter_timer = 0;
				}
			}
		}
	}
	else{
		if(p_meter > 0 and !p_meter_on){
			p_meter = max(p_meter-0.5,0);
			p_meter_timer = 0;
		}
		else if(!key_run){
			p_meter_on = false;
			jump_speed = -5.3;
			p_meter_timer = 0;
		}
	}
}

function enemy_hit(objeto_enemy){
	var enemy = instance_place(x,y+2,objeto_enemy)
	if(enemy != noone and enemy.hp > 0){
		with(enemy){
			obj_player.v_speed = -3;
			enemy.hp--;
			//criar o texto informando o score;
		}
	}
}

function power_up_item(objeto){
	global.game_paused = true;
	if(object_get_name(objeto) == string("obj_mushroom")){
		obj_player.hp++;
		obj_player.power_up = "mushroom";
	}
}

function power_up_dec(){
	global.game_paused = true;
	obj_player.hp--;
	obj_player.iframe = true;
	if(string(obj_player.power_up) == "mushroom"){
		obj_player.power_up = "padrao";
	}
	else{
		obj_player.state = character_state.dying;
		obj_player.v_speed = -5;
	}
}