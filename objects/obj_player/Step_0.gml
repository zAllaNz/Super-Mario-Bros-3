var _dir = keyboard_check(ord("D"));
var _esq = keyboard_check(ord("A"));
var _jump = keyboard_check_pressed(vk_space);
var _run = keyboard_check(vk_shift);
 
//Work out where to move horizontally
if(_run){
	hsp = (_dir - _esq) * run_speed;
}
else{
	hsp = (_dir - _esq) * walk_speed;
}
 
//Work out where to move vertically
vsp = vsp + grv;


 
//Are we on the ground?
on_ground = place_meeting(x, y+1, obj_ground);
 
//Horizontal move & collide
var _hcol = move_and_collide(hsp, 0, obj_ground, abs(hsp))
 
//Walk down slope
if (on_ground) && (place_meeting(x,y + abs(hsp) + 1 ,obj_ground)) && (vsp >= 0){   
    vsp += abs(hsp) + 1;
}
 
//Vertical move & collide
var _vcol = move_and_collide(0, vsp, obj_ground, abs(vsp)+1 , hsp, vsp, hsp, vsp)
if (array_length(_vcol) > 0){
    if (vsp > 0){
		can_jump = 10;
	}
    vsp = 0;
}



switch(estado_player){
	case character_state.walking:
		sprite_index = spr_mario_walk;
		inverter_ximagem(_dir, _esq);
		if((!_dir and !_esq) or (_dir and _esq)){
			estado_player = character_state.idle;
		}
		else if(_jump and can_jump-- > 0){
			vsp = jump_speed;
			can_jump = 0;
			estado_player = character_state.jumping;	
		}
	break;
	
	case character_state.jumping:
		sprite_index = spr_mario_jump;
		if(on_ground and vsp == 0){
			estado_player = character_state.idle;
		}
		else if(_dir or _esq){
			inverter_ximagem(_dir, _esq);	
		}
	break;
	
	case character_state.running:
		sprite_index = spr_mario_run;
		inverter_ximagem(_dir, _esq);
		if(!_run){
			estado_player = character_state.walking;	
		}
	break;
	
	default:
		sprite_index = spr_mario_idle;
		if((_dir or _esq) and _run){
			estado_player = character_state.running;
		}
		else if((_dir or _esq) and !(_dir and _esq)){
			estado_player = character_state.walking;
		}
		else if(_jump and can_jump-- > 0){
			vsp = jump_speed;
			can_jump = 0;
			estado_player = character_state.jumping;	
		}
	break;
}