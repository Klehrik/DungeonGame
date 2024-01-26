/// obj_PlayerMenu : Draw

// Slide platform
var dX = xTo - x;
var dY = yTo - y;
x += dX / speedDiv;
y += dY / speedDiv;
if (abs(xTo - x) < 0.5) x = xTo;
if (abs(yTo - y) < 0.5) y = yTo;

if (x == xTo and y == yTo) isMoving = false;
else isMoving = true;


// Set attack button visiblity
// There are like 3 other ways of doing this I could think of
// but no one will read this so I don't care
if (attackIsVisible)
{
	textElementAttack.isVisible = true;
	textElementAttackMod.isVisible = true;
	textElementAttackTooltip.isVisible = true;
	hitPercentTooltip.isVisible = true;
}
else
{
	textElementAttack.isVisible = false;
	textElementAttackMod.isVisible = false;
	textElementAttackTooltip.isVisible = false;
	hitPercentTooltip.isVisible = false;
}


// Calculate and change
// - hit chance tooltip
// - attack modifier display
if (instance_exists(player))
{
	textElementAttackMod.text = "+" + string(player.attackModifier);
	
	if (instance_exists(enemy))
	{
		var chance = clamp((10 + player.attackModifier - enemy.ac + 1) * 10,	0, 100);
		hitPercentTooltip.text = "^rHit ^w" + string(chance) + "%";
	}
	else hitPercentTooltip.text = "^rHit ^w--%";
}


// Draw item display
for (var i = 0; i < array_length(obj_Player.items); i++)
{
	var item = obj_Player.items[i];
	
	// Set coordinates of the item "plate"
	// mod and div splits into two rows after item 4
	var _x = x + 39 + ((i mod 4) * 12);
	var _y = y + 7 + (i div 4 * 13);
	
	if (instance_exists(item))
	{
		draw_sprite(spr_Items, 1, _x, _y);
		item.x = _x + 1;
		item.y = _y - 7;
	}
	else draw_sprite(spr_Items, 0, _x, _y);
}