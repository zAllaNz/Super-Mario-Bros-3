switch(state){
	case "animation_freeze":
		na_tela = on_screen(id);
		if(na_tela){
			animation_init = item_in_block(id, obj_empty_block);
			if(animation_init){
				state = "animation_up";
				animation_init = false;
			}
		}
	break;
	
	case "animation_up":
		animation_init = anim_up(id, animation_start, animation_distance, animation_speed);
		if(!animation_init){
			state = "animation_down";
			animation_start -= 8;
		}
	break;
	
	case "animation_down":
		animation_init = anim_down(id, animation_start, animation_distance, animation_speed);
		if(!animation_init){
			state = "animation_destroy";
		}
	break;
	
	case "animation_destroy":
		instance_destroy();
		instance_create_layer(x,y,"Collision",obj_coin_effect);
		//Incrementar o número de moedas
	break;
}
