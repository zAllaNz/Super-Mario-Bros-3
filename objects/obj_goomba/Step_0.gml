switch(state){
	case "walk":
		player_hit();
		v_speed = enemys_physics(v_speed, walk_speed, grav, on_ground);
		if(place_meeting(x+(walk_speed*2),y,obj_ground)){
			walk_speed *= -1;
		}
		if(count > frames){
			image_xscale *= -1
			count = 0;
		}
		if(hp <= 0){
			state = "dead";
			count = 0;
		}
		count++;
		if(!on_screen(id)){
			state = "idle";
		}
	break;
	
	case "dead":
		image_index = 1;
		count ++;
		enemy_destroy(count,count_max);
	break;
	
	default:
		if(on_screen(id)){
			state = "walk";
		}
	break;
}