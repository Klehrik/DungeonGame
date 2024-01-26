/// obj_Manager : Init

#macro viewWidth camera_get_view_width(view_camera[0])
#macro viewHeight camera_get_view_height(view_camera[0])
#macro colorWhite #fff1e8
#macro colorRed #ff004d

depth = -5000;
randomize();
draw_set_font(fnt_TheoreticalEdited);
draw_set_circle_precision(64);
surface_resize(application_surface, viewWidth, viewHeight);

global.showDebug = false;


// Game states
gameInit = function()
{
	roomNumber = -1;
	floorNumber = 1;
	gems = 10;
	
	floorLayout = [0, 0, 0, 0, "Shop", 0, 0, 0, 0, "Boss"];
	
	floorBar = instance_create_depth(0, 0, 0, obj_FloorBar);
	gemCount = instance_create_depth(4, 18, 0, obj_GemCount);
	platformPlayer = instance_create_depth(41, 52, 0, obj_PlayerPlatform);
	platformEnemy = noone;
	playerMenu = instance_create_depth(38, 92, 0, obj_PlayerMenu);

	player = instance_create_depth(0, 0, 0, obj_Player);
	enemy = noone;
	platformPlayer.entity = player;
	playerMenu.player = player;
	
	state = roomCreation;
}

roomCreation = function()
{
	playerMenu.yTo = 92;
	
	roomNumber += 1;
	player.mp += 1;
		
	var _room = floorLayout[min(roomNumber, 9)];
	switch (_room)
	{
		case "Shop":
			shop = instance_create_depth(160, 22, 0, obj_Shop);
			shop.xTo = 91;
			shop.manager = id;
			
			playerMenu.attackIsVisible = false;
			playerMenu.buttonAttack.text = "Leave";		// Reduce reuse recycle
			
			state = roomCreation_slideInShop;
			break;
				
			
		default:
			var enemyList = [obj_Skeleton]//, obj_Wolf];
			enemy = instance_create_depth(0, 0, 0, enemyList[irandom_range(0, array_length(enemyList) - 1)]);
			enemy.set_stats(floorNumber);
		
			platformEnemy = instance_create_depth(160, 52, 0, obj_EnemyPlatform);
			platformEnemy.xTo = 83;
			platformEnemy.entity = enemy;
			
			playerMenu.enemy = enemy;
			playerMenu.attackIsVisible = true;
			playerMenu.buttonAttack.text = "Attack";
			
			state = roomCreation_slideInBattle;
			break;
	}
}

roomCreation_slideInBattle = function()
{
	// Loading...
	if (!platformEnemy.isMoving) state = playerTurn;
}

roomCreation_slideInShop = function()
{
	// Some refactoring needed later this looks bad
	if (!shop.isMoving) state = shop_waiting;
}


playerTurn = function()
{
	// Attack Button
	if (playerMenu.buttonAttack.isPressed)
	{
		state = playerTurn_rolling;
	}
	
	
	// Check for item usage
	for (var i = 0; i < array_length(player.items); i++)
	{
		var item = player.items[i];
		
		if (instance_exists(item))	// Check if the slot has an item
		{
			if (item.button.isPressed)	// Check if the item was clicked
			{
				if (item.use(player, enemy, id))	// Try to use the item
				{
					if (item.consumable) item.remove()	// Remove the item if it is a consumable
					state = entityCheck;
				}
			}
		}
	}
}

playerTurn_rolling = function()
{
	roll = irandom_range(1, 10) + player.attackModifier;
	create_popup(80, 32, "Rolled a ^r" + string(roll) + "^w!");
		
	if (roll >= enemy.ac)
	{
		player.play_animation();
		state = playerTurn_attack;
	}
	else
	{
		enemy.play_animation();
		state = enemyTurn_attack;
	}
	entityHit = false;
}

playerTurn_attack = function()
{
	if (player.image_index >= player.hitFrame and !entityHit)
	{
		entityHit = true;
		enemy.hp -= 1;
	}
	if (!player.isPlayingAnimation) state = entityCheck;
}

enemyTurn_attack = function()
{
	if (enemy.image_index >= enemy.hitFrame and !entityHit)
	{
		entityHit = true;
		player.hp -= enemy.attack;
		create_popup(60, 65, "^r-" + string(enemy.attack));
	}
	if (!enemy.isPlayingAnimation) state = entityCheck;
}


entityCheck = function()
{
	if (enemy.hp <= 0 or enemy.ac <= 0)
	{	
		state = battleWon_init;
	}
	else
	{
		state = playerTurn;
		
		// Enemy special skills
		var _special = enemy.get_special_names();
		if (in_array(_special, "Aggressive"))
		{
			state = enemyTurn_attack;
		}
	}
}


battleWon_init = function()
{
	platformEnemy.yTo = 140;
	playerMenu.yTo = 128;
	
	gems += enemy.value;
	
	state = battleWon;
}

battleWon = function()
{
	if (!platformEnemy.isMoving)
	{
		instance_destroy(enemy);
		instance_destroy(platformEnemy);
		
		state = roomCreation;
	}
}


shop_waiting = function()
{
	shop.gems = gems;
	shop.items = player.items;
	
	// Leave Button
	if (playerMenu.buttonAttack.isPressed)
	{
		shop.xTo = 180;
		playerMenu.yTo = 128;
		
		state = shop_leaving;
	}
	
	// Check for item usage
	for (var i = 0; i < array_length(player.items); i++)
	{
		var item = player.items[i];
		
		if (instance_exists(item))	// Check if the slot has an item
		{
			if (item.button.isPressed and item.useDelay <= 0)	// Check if the item was clicked
			{
				if (item.use(player, enemy, id))	// Try to use the item
				{
					if (item.consumable) item.remove()	// Remove the item if it is a consumable
				}
			}
		}
	}
}

shop_leaving = function()
{
	if (!shop.isMoving)
	{
		instance_destroy(shop);
		state = roomCreation;
	}
}


state = gameInit;