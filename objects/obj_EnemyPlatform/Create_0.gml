/// obj_EnemyPlatform : Init

event_inherited();


textElement1 = create_text_element(id, x + 37, y + 4, "", true);
textElement2 = create_text_element(id, x, y + 14, "^rAC");
textElement3 = create_text_element(id, x, y + 22, "^rAttack");
textElement4 = create_text_element(id, x + 37, y + 14, "20", true);
textElement5 = create_text_element(id, x + 37, y + 22, "10", true);

create_tooltip_element(textElement1, textElement1.x - 38, textElement1.y - 1, 38, 8, "It's the enemy!");
create_tooltip_element(textElement2, textElement2.x - 1, textElement2.y - 1, 38, 8, "The enemy's ^rarmor class^w.^nRoll equal to or higher than^nthis number to deal damage.");
create_tooltip_element(textElement3, textElement3.x - 1, textElement3.y - 1, 38, 8, "The enemy's ^rattack power^w.^nYou will take damage^nif you roll below ^rAC^w!");

entity = noone;		// Entity to display stats of