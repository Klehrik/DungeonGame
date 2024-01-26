/// obj_Manager : Step

state();


// Send values to displays
floorBar.roomNumber = roomNumber;
floorBar.floorNumber = floorNumber
gemCount.gems = gems;


// Clamp player and enemy values
if (instance_exists(player))
{
	player.hp = clamp(player.hp, 0, player.hpMax);
	player.mp = clamp(player.mp, 0, player.mpMax);
}
if (instance_exists(enemy))
{
	enemy.ac = max(enemy.ac, 0);
}