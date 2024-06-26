//Inicio da state machine do player
switch(state){
	case character_state.walking:
		key_buttons();
		player_physics();
		inverter_ximagem();
		p_meter_control(state);
		vel = walk_speed;
		if(power_up == "padrao"){
			sprite_index = spr_mario_walk;
			image_speed = 1;
		}
		else if(power_up == "mushroom"){
			sprite_index = spr_mario_mushroom_walk;
			image_speed = 1;
		}
		if(key_jump){
			player_jump();
			state = character_state.jumping;
		}
		else if(key_run and arrow_pressed() != 0){
			if(on_slope()){
				var slope = slope_up(h_speed);
				if(!slope and on_slope()){
					state = character_state.running;	
				}
			}
			else if(!on_slope()){
				state = character_state.running;	
			}
		}
		else if(h_speed == 0 and arrow_pressed() == 0){
			state = character_state.idle;
		}
	break;
	
	case character_state.jumping:
		key_buttons();
		player_physics();
		inverter_ximagem();
		enemy_hit(obj_enemy_normal);
		p_meter_control(state);
		if(power_up == "padrao"){
			if(!p_meter_on){
				sprite_index = spr_mario_jump;
			}
			else{
				sprite_index = spr_mario_jump_2;
			}
		}
		else if(power_up == "mushroom"){
			if(!p_meter_on){
				sprite_index = spr_mario_mushroom_jump;
			}
			else{
				sprite_index = spr_mario_mushroom_jump_2;
			}
		}
		if(on_ground and v_speed == 0 and arrow_pressed()){
			state = character_state.walking;
		}
		else if(on_ground and v_speed == 0){
			state = character_state.idle;
		}
	break;
	
	case character_state.running:
		key_buttons();
		player_physics();
		inverter_ximagem();
		p_meter_control(state);
		if(p_meter_on){
			vel = max_speed;
		}
		else{
			vel = run_speed;
		}
		
		if(power_up == "padrao"){
			if(!p_meter_on){
				sprite_index = spr_mario_walk;
				image_speed = 2;
			}
			else{
				sprite_index = spr_mario_run;
			}
		}
		else if(power_up == "mushroom"){
			if(!p_meter_on){
				sprite_index = spr_mario_mushroom_walk;
				image_speed = 2;
			}
			else{
				sprite_index = spr_mario_mushroom_run;
			}
		}
		
		if(key_jump){
			player_jump();
			state = character_state.jumping;
		}
		else if(key_run and arrow_pressed() != 0 and on_slope()){
			var slope = slope_up(h_speed)
			if(slope){
				state = character_state.walking;
			}
		}
		else if(!key_run and arrow_pressed() != 0){
			state = character_state.walking;
		}
		else if(h_speed == 0 and arrow_pressed() == 0){
			state = character_state.idle;
		}
	break;
	
	case character_state.dying:
		sprite_index = spr_mario_death;
		v_speed += grav;
		move_and_collide(0,v_speed,obj_game_controller);
	break;
	
	default:
		key_buttons();
		player_physics();
		inverter_ximagem();
		p_meter_control(state);
		
		if(power_up == "padrao"){
			sprite_index = spr_mario_idle;
		}
		else if(power_up == "mushroom"){
			sprite_index = spr_mario_mushroom_idle;
		}
		
		if(arrow_pressed() != 0 and key_run){
			state = character_state.running;
		}
		else if(arrow_pressed() != 0){
			state = character_state.walking;
		}
		else if(key_jump){
			player_jump();
			state = character_state.jumping;
		}
	break;
}

if(keyboard_check(ord("L"))){
	power_up = "mushroom";
}

////////transformar em função
if(iframe){
	iframe_count++;
	if(!character_state.dying){
		if(iframe_count > 120){
			image_alpha = 1;
			iframe_count = 0
			iframe = false;
		}
		else if(iframe_count % 2 == 0){
			if(image_alpha == 0.8){
				image_alpha = 0;
			}
			else{
				image_alpha = 0.8;
			}
		}
	}
	else{
		obj_game_controller.max_count = 120;
	}
}