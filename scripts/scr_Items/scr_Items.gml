/// Items

function create_item(name)
{
	var item = instance_create_depth(-16, -16, 0, obj_Item);
	item.name = name;
	
	switch (name)
	{
		case "Potion":
			item.description = "Restores 10 ^rHP^w.^n^rConsumable^w.";
			item.image_index = 3;
			item.price = irandom_range(22, 32);
			
			item.use = function(player, enemy)
			{
				if (player.hp < player.hpMax)
				{
					player.hp += 10;
					create_popup(80, 32, "You recovered 10 ^rHP^w!");
					create_popup(58, 65, "^r+10");
					return true;
				}
				create_popup(80, 32, "You're already at full ^rHP^w!");
				return false;
			}
			break;
			
			
		case "Ether":
			item.description = "Restores 10 ^rMP^w.^n^rConsumable^w.";
			item.image_index = 4;
			item.price = irandom_range(22, 32);
			
			item.use = function(player, enemy)
			{
				if (player.mp < player.mpMax)
				{
					player.mp += 10;
					create_popup(80, 32, "You recovered 10 ^rMP^w!");
					create_popup(58, 73, "^r+10");
					return true;
				}
				create_popup(80, 32, "You're already at full ^rMP^w!");
				return false;
			}
			break;
			
		
		case "Elixir":
			item.description = "Restores 10 ^rHP ^wand 10 ^rMP^w.^n^rConsumable^w.";
			item.image_index = 5;
			item.price = irandom_range(38, 46);
			
			item.use = function(player, enemy)
			{
				if (player.hp < player.hpMax or player.mp < player.mpMax)
				{
					player.hp += 10;
					player.mp += 10;
					create_popup(80, 32, "You recovered 10 ^rMP ^wand 10 ^rMP^w!");
					create_popup(58, 65, "^r+10");
					create_popup(58, 73, "^r+10");
					return true;
				}
				create_popup(80, 32, "You're already at full ^rHP ^wand ^rMP^w!");
				return false;
			}
			break;
			
		
		case "Bomb":
			item.description = "Reduces the enemy's ^rAC ^wby 4,^nmaking them easier to hit.^nIf reduced to 0,^nyou automatically win.^n^rConsumable^w.";
			item.image_index = 6;
			item.price = irandom_range(22, 32);
			
			item.use = function(player, enemy)
			{
				if (instance_exists(enemy))
				{
					enemy.ac -= 4;
					create_popup(80, 32, "The enemy's ^rAC^w was^nreduced by 4!");
					create_popup(116, 65, "^r-4");
					return true;
				}
				create_popup(80, 32, "You can't use that right now!");
				return false;
			}
			break;
			
		
		
		case "Tome of Weakening":
			item.description = "Reduces the enemy's ^rAC ^wby 1,^nmaking them easier to hit.^nCosts 1 ^rMP^w.";
			item.image_index = 2;
			item.price = irandom_range(54, 62);
			item.consumable = false;
			
			item.use = function(player, enemy)
			{
				if (instance_exists(enemy))
				{
					if (player.mp >= 1)
					{
						if (enemy.ac > 1)
						{
							player.mp -= 1;
							enemy.ac -= 1;
							create_popup(80, 32, "The enemy's ^rAC^w was^nreduced by 1!");
							create_popup(116, 65, "^r-1");
							create_popup(60, 73, "^r-1");
							return true;
						}
						create_popup(80, 32, "The enemy's ^rAC^w can't^n be lowered further!");
						return false;
					}
					create_popup(80, 32, "You don't have enough ^rMP^w!");
					return false;
				}
				create_popup(80, 32, "You can't use that right now!");
				return false;
			}
			break;
			
		
		case "Tome of Healing":
			item.description = "Heals you for 2 ^rHP^w.^nCosts 1 ^rMP^w.";
			item.image_index = 2;
			item.price = irandom_range(54, 62);
			item.consumable = false;
			
			item.use = function(player, enemy)
			{
				if (player.mp >= 1)
				{
					if (player.hp < player.hpMax)
					{
						player.mp -= 1;
						player.hp += 2;
						create_popup(80, 32, "You recovered 2 ^rHP^w!");
						create_popup(60, 65, "^r+2");
						create_popup(60, 73, "^r-1");
						return true;
					}
					create_popup(80, 32, "You're already at full ^rHP^w!");
					return false;
				}
				create_popup(80, 32, "You don't have enough ^rMP^w!");
				return false;
			}
			break;
	}
	
	return item;
}