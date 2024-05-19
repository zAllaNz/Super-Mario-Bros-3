switch(state){
	case "walk":
		sprite_index = spr_red_koopa_troopa_walk;
		image_speed = 1;
		v_speed = enemys_physics(v_speed, walk_speed, grav, on_ground);
		if(place_meeting(x+sign(walk_speed),y,obj_ground)){
			walk_speed *= -1;
			image_xscale *= -1;
		}
		if(!on_screen(id)){
			state = "idle";
		}
		if(hp <= 0){
			state = "dead";
		}
	break;
	
	case "dead":
		sprite_index = spr_red_koopa_troopa_shel;
		image_index = 0;
		image_speed = 0;
		count++;
		if(count > count_back){
			count = 0;
			hp++;
			state = "walk";
		}
	break;
	
	default:
		if(on_screen(id)){
			state = "walk";
		}
	break;
}