/// obj_Text : Init

// Used for greater control over displaying text elements

text = "";
flip = false;

isVisible = true;

parent = noone;
parentOffset = {x: 0, y: 0}

tooltip = false;


set_parent = function(_id)
{
	parent = _id;
	parentOffset.x = x - parent.x;
	parentOffset.y = y - parent.y;
}