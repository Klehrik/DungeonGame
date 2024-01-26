/// obj_PlayerPlatform : Step

event_inherited();


// Move entity and set values
if (instance_exists(entity))
{
	entity.x = x;
	entity.y = y - 20;
	
	textElement4.text = entity.hp;
	textElement5.text = entity.mp;
	textElement8.text = "^r" + string(entity.hpMax);
	textElement9.text = "^r" + string(entity.mpMax);
}