item_in_block(id, obj_empty_block);
if(na_tela){
	v_speed = enemys_physics(v_speed, walk_speed, grav, on_ground);
	if(instance_place(x,y,obj_player)){
		power_up_item(object_index);
		instance_destroy();
	}
}
else if(image_alpha == 1){
	count++;
	if(count > 5){
		na_tela = true;
	}
}