/// Misc Scripts

function create_text_element(parent, x, y, text, flip = false)
{
	var element = instance_create_depth(x, y, 0, obj_Text);
	element.text = text;
	element.flip = flip;
	
	if (instance_exists(parent)) element.set_parent(parent);
	
	return element;
}

function create_tooltip_element(parent, x, y, width, height, text)
{
	var element = instance_create_depth(x, y, 0, obj_Tooltip);
	element.width = width;
	element.height = height;
	element.text = text;
	
	if (instance_exists(parent)) element.set_parent(parent);
	
	return element;
}

function create_button_element(parent, x, y, width, height, text)
{
	var element = instance_create_depth(x, y, 0, obj_Button);
	element.width = width;
	element.height = height;
	element.text = text;
	
	if (instance_exists(parent)) element.set_parent(parent);
	
	return element;
}

function create_popup(x, y, text)
{
	var element = instance_create_depth(x, y, 0, obj_Popup);
	element.text = text;

	return element;
}



function draw_text_effects(x, y, text, flip = false)
{
	if (flip) x -= string_dimensions(text).width;
	
	var col = colorWhite;
	var index = 1;
	var _x = x;
	var _y = y;
	
	while (index <= string_length(text))
	{
		if (string_copy(text, index, 1) == "^")
		{
			var code = string_copy(text, index + 1, 1);
			switch (code)
			{
				case "n": // New line
					_x = x;
					_y += 9;
					break;
					
				case "w": // White text
					col = colorWhite;
					break;
					
				case "r": // Red text
					col = colorRed;
					break;
					
				case "b": // Black text
					col = c_black;
					break;
			}
			index += 2;
		}
		else
		{
			var char = string_copy(text, index, 1);
			draw_text_colour(_x, _y, char, col, col, col, col, 1);
			_x += string_width(char);
			index += 1;
		}
	}
}

function string_dimensions(text)
{
	// Converts custom string to standard
	// and returns dimensions
	
	var index = 1;
	var new_string = "";
	var extra_rows = 0;
	
	while (index <= string_length(text))
	{
		if (string_copy(text, index, 1) == "^")
		{
			var code = string_copy(text, index + 1, 1);
			if (code == "n")
			{
				new_string += "\n"
				extra_rows += 1;
			}
			index += 2;
		}
		else
		{
			var char = string_copy(text, index, 1);
			new_string += char;
			index += 1;
		}
	}
	
	return {
		width:	string_width(new_string),
		height:	6 + (extra_rows * 9)
	}
}

function string_shadow(text)
{
	// Custom string but all black
	// Used for text drop shadow
	
	var index = 1;
	var new_string = "";
	var extra_rows = 0;
	
	while (index <= string_length(text))
	{
		if (string_copy(text, index, 1) == "^" and string_copy(text, index + 1, 1) != "n") index += 2;
		else
		{
			var char = string_copy(text, index, 1);
			new_string += char;
			index += 1;
		}
	}
	
	return "^b" + new_string;
}



function in_array(array, value)
{
	for (var i = 0; i < array_length(array); i++)
	{
		if (array[i] == value)
		{
			return true;
			break;
		}
	}
}