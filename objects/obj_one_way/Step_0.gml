na_tela = on_screen(id);
if(na_tela){
	if(obj_player.on_ground and array_length(obj_player.collision_blocks) == 1){
		array_push(obj_player.collision_blocks, obj_one_way);
	}
	else{
		if(obj_player.v_speed < 0){
			obj_player.collision_blocks = [obj_ground];
		}
		else{
			array_push(obj_player.collision_blocks, obj_one_way);
		}
	}
}
/// CONTINUAR AMANHÃAAAAAAAAAAA