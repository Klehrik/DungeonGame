/// obj_PlayerPlatform : Init

event_inherited();


textElement1 = create_text_element(id, x, y + 4, "Player");
textElement2 = create_text_element(id, x, y + 14, "^rHP");
textElement3 = create_text_element(id, x, y + 22, "^rMP");
textElement4 = create_text_element(id, x + 23, y + 14, "0", true);
textElement5 = create_text_element(id, x + 23, y + 22, "0", true);
textElement6 = create_text_element(id, x + 25, y + 14, "^r/");
textElement7 = create_text_element(id, x + 25, y + 22, "^r/");
textElement8 = create_text_element(id, x + 37, y + 14, "0", true);
textElement9 = create_text_element(id, x + 37, y + 22, "0", true);

create_tooltip_element(textElement1, textElement1.x - 1, textElement1.y - 1, 38, 8, "It's you!");
create_tooltip_element(textElement2, textElement2.x - 1, textElement2.y - 1, 38, 8, "Your ^rhit points^w.^nIf this falls to 0,^nyou are defeated.");
create_tooltip_element(textElement3, textElement3.x - 1, textElement3.y - 1, 38, 8, "Your ^rmagic points^w.^nUse them to cast spells.^nWill replenish by 1 when^nentering a new room.");

entity = noone;		// Entity to display stats of