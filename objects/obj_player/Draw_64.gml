draw_set_color(c_black);
draw_rectangle(view_wport[0],0,view_wport[0]-200,65,false);
draw_set_color(c_white);
draw_set_font(ft_arial);
draw_text(view_wport[0]-200, 0, "Estado: " + string(state));
draw_text(view_wport[0]-200, 15, "Gravidade: " + string(grav));
draw_text(view_wport[0]-200, 30, "Velocidade: " + string(h_speed));
draw_text(view_wport[0]-200, 45, "Vel. Vertical: " + string(v_speed));
draw_set_color(c_white);