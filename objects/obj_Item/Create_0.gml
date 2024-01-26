/// obj_Item : Init

depth = -100;
image_speed = 0;

name = "ITEM";
description = "DESCRIPTION";
price = 0;

tooltip = create_tooltip_element(id, x - 1, y - 1, 9, 9, "");
button = create_button_element(id, x - 1, y - 1, 9, 9, "");
button.isVisible = false;

consumable = true;

useDelay = 0;	// Prevent accidental use when purchasing from shop


use = function() {}
remove = function()
{
	instance_destroy(tooltip);
	instance_destroy(button);
	instance_destroy();
}