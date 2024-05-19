draw_sprite(medidor_p, image_index, medidor_pos_x, medidor_pos_y);
for(var i = 0; i < 7; i++){
	draw_sprite(flecha_medidor, image_index, flecha_medidor_pos_x+(flecha_dist*i), flecha_medidor_pos_y);
}
for(var i = 6; i > 6 - flecha_count; i--){
	draw_sprite(flecha_medidor_2, image_index, flecha_medidor_pos_x+(flecha_dist*i), flecha_medidor_pos_y);
}
draw_set_font(ft_mario_3);
draw_text_color(medidor_pos_x,medidor_pos_y*4,"0000000", c_yellow, c_yellow, c_white, c_white, 1);