//Inicio da state machine do player
switch(state){
	case character_state.walking:
		key_buttons();
		player_physics();
		inverter_ximagem();
		vel = walk_speed;
		if(power_up == "padrao"){
			sprite_index = spr_mario_walk;
		}
		else if(power_up == "mushroom"){
			sprite_index = spr_mario_mushroom_walk;
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
		sprite_index = spr_mario_jump;
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
		vel = run_speed;
		sprite_index = spr_mario_run;
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
	
	default:
		key_buttons();
		player_physics();
		inverter_ximagem();
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