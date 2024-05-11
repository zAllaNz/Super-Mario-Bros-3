var _dir = keyboard_check(ord("D"));
var _esq = keyboard_check(ord("A"));
var _jump = keyboard_check_pressed(vk_space);
var _run = keyboard_check(vk_shift);
var _debug = keyboard_check_pressed(ord("G"));
var _restart = keyboard_check_pressed(ord("R"));

if(_debug){
	life--;
}
else if(_restart){
	room_restart();
}
 
//Work out where to move horizontally
hsp = (_dir - _esq) * walk_speed;
 
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

if(life == 0){
	estado_player = character_state.dying;
}

switch(estado_player){
	case character_state.walking:
		sprite_index = spr_mario_walk;
		walk_speed = 2;
		inverter_ximagem(_dir, _esq);
		if((!_dir and !_esq) or (_dir and _esq)){
			estado_player = character_state.idle;
		}
		else if(_jump and can_jump-- > 0){
			vsp = jump_speed;
			can_jump = 0;
			estado_player = character_state.jumping;	
		}
		else if(_run){
			estado_player = character_state.running;		
		}
	break;
	
	case character_state.running:
		sprite_index = spr_mario_run;
		jump_speed = -6;
		walk_speed = 4;
		inverter_ximagem(_dir, _esq);
		if((!_dir and !_esq) or (_dir and _esq)){
			estado_player = character_state.idle;
		}
		else if((!_run) or (!_dir and !_esq)){
			estado_player = character_state.walking;	
		}
		else if(_jump and can_jump-- > 0){
			vsp = jump_speed;
			can_jump = 0;
			estado_player = character_state.jumping;	
		}
	break;
	
	case character_state.jumping:
		if(jump_speed == -6){
			sprite_index = spr_mario_jump_2;
		}
		else{
			sprite_index = spr_mario_jump;
		}
		if(on_ground and vsp == 0){
			estado_player = character_state.idle;
		}
		else if(_dir or _esq){
			inverter_ximagem(_dir, _esq);	
		}
	break;
	
	case character_state.grabbing:
		//player agarrando algum item
	break;
	
	case character_state.kicking:
		//player chutando item
	break;
	
	case character_state.dying:
		//estado do player morrendo
		sprite_index = spr_mario_death;
	break;
	
	default:
		sprite_index = spr_mario_idle;
		jump_speed = -5;
		if((_dir or _esq) and _run and !(_dir and _esq)){
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