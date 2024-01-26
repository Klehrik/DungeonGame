/// obj_Shop : Draw

draw_self();


for (var i = 0; i < array_length(offers); i++)
{	
	var item = offers[i];
	
	if (item != noone)
	{
		var _x = x + 5 + ((i mod 3) * 16);
		var _y = y + 17 + (i div 3 * 24);
		
		// Set coordinates of the item
		// mod and div splits into two rows after item 3
		item.x = _x;
		item.y = _y;
		item.tooltip.delayMax = 0;
		
		// Draw white plate
		draw_sprite(spr_Items, 1, _x - 1, _y + 7);
		
		// Show price
		var col = colorRed;
		if (manager.gems >= item.price) col = colorWhite;
		var offset = 0;
		if (item.price < 10) offset = 2;
		draw_text_color(_x + offset, _y + 12, item.price, col, col, col, col, 1);
		
		
		// Purchase item
		if (item.button.isPressed)
		{
			if (manager.gems >= item.price)
			{
				// Get empty inventory slot
				var slotted = false;
				for (var j = 0; j < array_length(manager.player.items); j++)
				{
					if (!instance_exists(manager.player.items[j]))
					{
						manager.gems -= item.price;
						manager.player.items[j] = item;
						offers[i] = noone;
						item.useDelay = 10;
						slotted = true;
						break;
					}
				}
				
				if (slotted) create_popup(80, 32, "Item purchased!");
				else create_popup(80, 32, "You don't have any space!");
			}
			else create_popup(80, 32, "You don't have enough ^rgems^w!");
		}
	}
}