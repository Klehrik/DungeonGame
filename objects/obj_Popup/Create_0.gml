/// obj_Popup : Init

text = "";
timer = 120;
vsp = 0.4;

// Shorten the lifespan of all other popups to make this more prominent
with (obj_Popup)
{
	if (id != other.id) timer /= 3;
}