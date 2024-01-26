/// obj_Text : Draw

// Follow parent
if (instance_exists(parent))
{
	x = parent.x + parentOffset.x;
	y = parent.y + parentOffset.y;
}


// Main text
if (isVisible) draw_text_effects(x, y - 1, text, flip);