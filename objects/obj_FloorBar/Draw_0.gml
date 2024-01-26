/// obj_FloorBar : Draw

draw_self();


// Display floor number
textElement1.text = "Floor " + string(floorNumber);


// Draw map icons
draw_sprite(spr_MapIcons, 1, x + 76, y + 8);
draw_sprite(spr_MapIcons, 2, x + 111, y + 8);

// Slide player icon to position before drawing
var playerIconXTo = x + 48 + (clamp(roomNumber, 0, 9) * 7);
var speedDiv = 14;
playerIconX += (playerIconXTo - playerIconX) / speedDiv;
if (abs(playerIconXTo - playerIconX) < 0.5) playerIconX = playerIconXTo;

draw_sprite(spr_MapIcons, 0, playerIconX, y + 8);