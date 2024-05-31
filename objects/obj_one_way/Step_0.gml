na_tela = on_screen(id);
if(na_tela){
	if(obj_player.v_speed < 0 and collision){
		collision = false;
		obj_player.collision_blocks = [obj_ground];
	}
	else if(obj_player.v_speed > 0 and !collision){
		collision = true;
		array_push(obj_player.collision_blocks, obj_one_way);
	}
}
