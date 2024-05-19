switch(state){
	case "walk":
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
	break;
	
	default:
		if(on_screen(id)){
			state = "walk";
		}
	break;
}