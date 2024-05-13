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
acel = 0.25;
decel = 0.1;
jump_speed = -5;
on_ground = false;
state = character_state.idle;
p_meter = 0;
max_p_meter = 70;
count = 0
power_up = "padrao";