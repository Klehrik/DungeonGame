/// obj_EnemyPlatform : Step

event_inherited();


// Move entity and set values
if (instance_exists(entity))
{
	entity.x = x + 38;
	entity.y = y - 20;
	
	textElement1.text = entity.name;
	textElement4.text = entity.ac;
	textElement5.text = entity.attack;
}