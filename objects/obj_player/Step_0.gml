//Inicio da state machine do player
switch(state){
	case character_state.walking:
		key_buttons();
		player_physics();
		inverter_ximagem();
		vel = walk_speed;
		sprite_index = spr_mario_walk;
		if(key_jump){
			player_jump();
			state = character_state.jumping;
		}
		else if(key_run and arrow_pressed() != 0){
			state = character_state.running;	
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
		sprite_index = spr_mario_idle;
		if((key_right or key_left) and key_run){
			state = character_state.running;
		}
		else if(key_right or key_left){
			state = character_state.walking;
		}
		else if(key_jump){
			player_jump();
			state = character_state.jumping;
		}
	break;
}