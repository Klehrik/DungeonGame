/// obj_Text : Draw

// Main text
draw_set_color(color);
draw_set_font(font);

draw_text(x, y, text);


// Tooltip
if (tooltip != "")
{
	var textWidth = string_width(text);
	var textHeight = string_height(text);
	var textPadding = -1;	// Literally gotta have reverse padding lmao
	
	if (point_in_rectangle(mouse_x, mouse_y, x - textPadding, y - textPadding, x + textWidth + textPadding, y + textHeight + textPadding))
	{
		if (tooltipDelay < tooltipDelayMax) tooltipDelay++;
		else
		{
			depth = -100;	// Setting this so that the tooltip draws over other elements
			
			// All the "+1"s here are for pixel-perfect alignment
			
			var boxPadding = 3;
			var boxWidth = string_width(tooltip) + (boxPadding * 2) + 1;
			var boxHeight = string_height(tooltip) + (boxPadding * 2);
			var _x = clamp(mouse_x - (boxWidth / 2),	2, viewWidth - boxWidth - 2);
			var _y = clamp(mouse_y - boxHeight - 1,		2, viewHeight - boxHeight - 2);
		
			for (var i = 1; i >= 0; i--) draw_sprite_stretched(spr_9S_RoundedRectangle, i, _x, _y, boxWidth, boxHeight);
			draw_set_color(tooltipColor);
			draw_text(_x + boxPadding + 1, _y + boxPadding, tooltip);
		}
	}
	else
	{
		tooltipDelay = 0;
		depth = 0;
	}
}