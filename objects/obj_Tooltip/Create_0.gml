/// obj_Tooltip : Init

depth = -1000;

width = 0;
height = 0;
text = "";

delay = 0;
delayMax = 20;

isVisible = true;

parent = noone;
parentOffset = {x: 0, y: 0}


set_parent = function(_id)
{
	parent = _id;
	parentOffset.x = x - parent.x;
	parentOffset.y = y - parent.y;
}