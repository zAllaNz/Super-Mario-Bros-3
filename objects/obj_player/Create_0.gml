// Variáveis personagem
enum character_state {
	idle,
	walking,
	jumping,
	running,
	grabbing,
	kicking,
	dying
}

grav = 0.2;
h_speed = 0;
v_speed = 0;
vel = 0
walk_speed = 2;
run_speed = 3;
max_speed = 4;
acel = 0.1;
decel = 0.1;
jump_speed = -5;
on_ground = false;
state = character_state.idle;
count = 0