draw_set_color(c_black);
draw_rectangle(view_wport[0],0,view_wport[0]-200,100,false);
draw_set_color(c_white);
draw_text(view_wport[0]-200, 0, "Estado: " + string(estado_player));
draw_text(view_wport[0]-200, 15, "Gravidade: " + string(grv));
draw_text(view_wport[0]-200, 30, "Velocidade: " + string(hsp));
draw_text(view_wport[0]-200, 45, "Vel. Vertical: " + string(vsp));
draw_set_color(c_white);