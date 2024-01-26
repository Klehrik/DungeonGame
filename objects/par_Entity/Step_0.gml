/// par_Entity : Step

// End animation
if (image_speed > 0 and image_index >= sprite_get_number(sprite_index) - 1)
{
	image_speed = 0;
	image_index = 0;
	isPlayingAnimation = false;
}

if (isPlayingAnimation) depth = -100;
else depth = 0;