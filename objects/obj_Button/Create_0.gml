/// obj_Button : Init

width = 0;
height = 0;
text = "";

isPressed = false;
pressDelay = 0;
pressDelayMax = 10;

isVisible = true;
isPressable = true;

parent = noone;
parentOffset = {x: 0, y: 0}


set_parent = function(_id)
{
	parent = _id;
	parentOffset.x = x - parent.x;
	parentOffset.y = y - parent.y;
}