/// par_Entity : Init

// Movement of this is only controlled by the platforms

image_speed = 0;
isPlayingAnimation = false;


play_animation = function(sprite = sprite_index)
{
	sprite_index = sprite;
	image_speed = 1;
	isPlayingAnimation = true;
}

get_special_names = function()	// Only for enemies
{
	var names = [];
	
	for (var i = 0; i < ds_list_size(special); i++)
	{
		names[array_length(names)] = special[| i].name;
	}
	
	return names;
}