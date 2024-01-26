/// obj_EnemyPlatform : Draw

draw_self();


// Draw enemy special
if (entity.hp > 0 or !isMoving)
{
	var start_x = x + 17 - ((ds_list_size(entity.special) - 1) * 4);
	for (var i = 0; i < ds_list_size(entity.special); i++)
	{
		var _x = start_x + (i * 8);
		var _y = y - 28;
	
		var _special = entity.special[| i];
		draw_sprite(spr_SpecialIcons, _special.icon, _x, _y);
	
		_special.tooltip.x = _x - 4;
		_special.tooltip.y = _y;
	}
}
else
{
	// Clean up the enemy's special icons
	if (ds_exists(entity.special, ds_type_list))
	{
		for (var i = 0; i < ds_list_size(entity.special); i++) instance_destroy(entity.special[| i].tooltip);
		ds_list_destroy(entity.special);
	}
}