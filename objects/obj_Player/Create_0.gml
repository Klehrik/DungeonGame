/// obj_Player : Init

event_inherited();

hp = 20;
hpMax = 20;
mp = 10;
mpMax = 10;
attackModifier = 0;

//items = [create_item("Tome of Weakening"), create_item("Potion"), create_item("Ether"), noone, noone, noone, noone, noone];
items = [create_item("Tome of Weakening"), create_item("Potion"), create_item("Ether"), create_item("Bomb"), noone, noone, noone, noone];

hitFrame = 20;	// Deal damage on this animation frame