/// obj_Button : Draw

// Follow parent
if (instance_exists(parent))
{
	x = parent.x + parentOffset.x;
	y = parent.y + parentOffset.y;
}


// Get button press
if (pressDelay > 0) pressDelay--;
if (isPressed) isPressed = false;
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width - 1, y + height - 1))
{
	if (mouse_check_button_pressed(mb_left) and pressDelay <= 0 and isPressable)
	{
		isPressed = true;
		pressDelay = pressDelayMax;
	}
}


// Draw button
// All the "+1"s here are for pixel-perfect alignment
if (isVisible)
{
	var dimensions = string_dimensions(text);
		
	var boxPadding = 3;
	var boxWidth = dimensions.width + (boxPadding * 2) + 1;
	var boxHeight = dimensions.height + (boxPadding * 2) + 4;

	if (pressDelay <= 0)
	{
		draw_sprite_stretched(spr_9S_RoundedRectangle, 1, x, y, boxWidth, boxHeight);
		draw_set_color(colorWhite);
		draw_text(x + boxPadding + 1, y + boxPadding, text);
	}
	else
	{
		draw_sprite_stretched(spr_9S_RoundedRectangle, 0, x, y + 2, boxWidth, boxHeight);
		draw_set_color(colorRed);
		draw_text(x + boxPadding + 1, y + boxPadding + 2, text);
	}
}


// Debug
if (global.showDebug)
{
	draw_set_color(c_fuchsia);
	draw_set_alpha(0.3);
	draw_rectangle(x, y, x + width - 1, y + height - 1, 0);
	draw_set_alpha(1);
}