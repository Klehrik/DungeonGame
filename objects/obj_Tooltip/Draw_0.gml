/// obj_Tooltip : Draw

// Follow parent
if (instance_exists(parent))
{
	x = parent.x + parentOffset.x;
	y = parent.y + parentOffset.y;
}

	
// Show tooltip
if (isVisible)
{
	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width - 1, y + height - 1))
	{
		if (delay < delayMax) delay++;
		else
		{
			// All the "+1"s here are for pixel-perfect alignment
			var dimensions = string_dimensions(text);
		
			var boxPadding = 3;
			var boxWidth = dimensions.width + (boxPadding * 2) + 1;
			var boxHeight = dimensions.height + (boxPadding * 2) + 4;
			var _x = clamp(mouse_x - (boxWidth / 2),	2, viewWidth - boxWidth - 2);
			var _y = clamp(mouse_y - boxHeight - 1,		2, viewHeight - boxHeight - 2);
		
			draw_sprite_stretched(spr_9S_RoundedRectangle, 0, _x, _y, boxWidth, boxHeight);
			draw_text_effects(_x + boxPadding + 1, _y + boxPadding, text);
		}
	}
	else delay = 0;
}


// Debug
if (global.showDebug)
{
	draw_set_color(c_yellow);
	draw_set_alpha(0.3);
	draw_rectangle(x, y, x + width - 1, y + height - 1, 0);
	draw_set_alpha(1);
}