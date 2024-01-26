/// par_Platform : Step

// Slide platform
var dX = xTo - x;
var dY = yTo - y;
x += dX / speedDiv;
y += dY / speedDiv;
if (abs(xTo - x) < 0.5) x = xTo;
if (abs(yTo - y) < 0.5) y = yTo;

if (x == xTo and y == yTo) isMoving = false;
else isMoving = true;