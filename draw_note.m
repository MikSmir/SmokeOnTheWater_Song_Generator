% This function calculates the end points for the duration of each note, 
% p_note and then plots each note on the same plot, Figure 1 in a different
% color, p_color.

function [v_epoint, v_plot] = draw_note(p_note, p_epoint, p_color)
  v_spoint = p_epoint; % Starting point for note %%%%% Before there was +1
  v_epoint = v_spoint + (length(p_note)-1); % End point for note
  hold on
  v_plot = plot(v_spoint:v_epoint, p_note, strcat(p_color, '-'));
end