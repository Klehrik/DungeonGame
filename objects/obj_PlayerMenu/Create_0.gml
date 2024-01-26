/// obj_PlayerMenu : Init

// Attack button
buttonAttack = create_button_element(id, x, y, 29, 14, "Attack");
hitPercentTooltip = create_tooltip_element(buttonAttack, buttonAttack.x, buttonAttack.y, 29, 14, "^rHit ^w--%");
hitPercentTooltip.delayMax = 0;

// Attack values
textElementAttack = create_text_element(id, x + 2, y + 18, "^rd10");
textElementAttackMod = create_text_element(id, x + 28, y + 18, "", true);
textElementAttackTooltip = create_tooltip_element(textElementAttack, textElementAttack.x - 1, textElementAttack.y - 1, 27, 8, "Your ^rattack power^w.^nA 10-sided die is^nrolled + your modifier.");

attackIsVisible = true;

player = noone;		// Used for calculating hit chances
enemy = noone;

xTo = x;
yTo = y;
speedDiv = 14;
isMoving = false;