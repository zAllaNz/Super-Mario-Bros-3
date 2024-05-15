switch(state){
	case animation_state.up:
		if(y > animation_start - animation_distance){
			y -= animation_speed;
			if(y == animation_start - animation_distance){
				state = animation_state.down;
			}
		}
	break;
	
	case animation_state.down:
		if(y < animation_start + animation_distance){
			y += animation_speed;
			if(y >= animation_start){
				state = animation_state.done;
			}
		}
	break;
	
	default:
		instance_destroy();
		instance_create_layer(x,y,"Collision",obj_empty_block_2);
	break;
}
