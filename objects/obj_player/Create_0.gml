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
run_speed = 2.5;
max_speed = 3;
acel = 0.15;
decel = 0.1;
jump_speed = -6;
on_ground = false;
state = character_state.idle;
p_meter_on = false;
p_meter = 0;
max_p_meter = 84;
p_meter_timer = 0;
p_meter_wait = 180;
power_up = "padrao";