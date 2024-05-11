// Variáveis personagem
enum character_state {
	idle,
	walking,
	jumping,
	running
}

estado_player = character_state.idle;
grv = 0.2;
hsp = 0;
vsp = 0;
walk_speed = 2;
run_speed = 4;
jump_speed = -5;
can_jump = 0;
on_ground = false;

function inverter_ximagem (_dir, _esq) {
	if((_dir and image_xscale != 1) or (_esq and image_xscale == 1)){
		image_xscale *= -1;
	}
}