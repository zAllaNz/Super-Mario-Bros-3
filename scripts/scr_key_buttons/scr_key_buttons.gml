///@description Função para detectar as entradas do teclado.
///@function key_buttons()
function key_buttons(){
	key_right = keyboard_check(ord("D"));
	key_left = keyboard_check(ord("A"));
	key_jump = keyboard_check_direct(vk_space);
	key_run = keyboard_check(vk_shift);
	debug = keyboard_check_pressed(ord("G"));
	restart = keyboard_check_pressed(ord("R"));
}