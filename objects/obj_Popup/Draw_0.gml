/// obj_Popup : Draw

depth = -1500 - y;

var dimensions = string_dimensions(text);

// Text outline
for (var _y = -1; _y <= 1; _y++)
{
	for (var _x = -1; _x <= 1; _x++)
	{
		draw_text_effects(x - (dimensions.width / 2) + _x, y - (dimensions.height / 2) + _y, string_shadow(text));
	}
}

draw_text_effects(x - (dimensions.width / 2), y - (dimensions.height / 2), text);

y -= vsp;
vsp *= 0.95;

timer -= 1;
if (timer <= 0) instance_destroy();