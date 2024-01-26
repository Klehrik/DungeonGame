/// obj_FloorBar : Init

textElement1 = create_text_element(id, x + 4, y + 4, "Floor -");
create_tooltip_element(textElement1, textElement1.x - 1, textElement1.y - 1, 28, 10, "The floor you are^ncurrently on.");
create_tooltip_element(id, x + 40, y + 3, 80, 10, "The map of the current floor.");

roomNumber = 0;
floorNumber = 0;
playerIconX = x + 48;