/// obj_Skeleton : Init

event_inherited();


name = "Skeleton";
hp = 1;
ac = 0;
attack = 0;
value = 0;

special = ds_list_create();

hitFrame = 26;	// Deal damage on this animation frame


set_stats = function(_floor)
{
	ac = irandom_range(4, 6) + floor(_floor / 2);
	attack = 3 + floor(_floor / 2);
	value = ac + attack;
}