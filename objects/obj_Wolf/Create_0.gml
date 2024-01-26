/// obj_Wolf : Init

event_inherited();


name = "Dire Wolf";
hp = 1;
ac = 0;
attack = 0;
value = 0;

special = ds_list_create();
special[| 0] = create_special("Aggressive");


set_stats = function(_floor)
{
	ac = irandom_range(4, 5) + floor(_floor / 2);
	attack = irandom_range(2, 3) + floor(_floor / 2);
	value = ac + attack + ceil(_floor / 2);
}