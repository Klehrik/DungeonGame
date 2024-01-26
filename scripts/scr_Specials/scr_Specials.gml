/// Special/Effect Icons

function create_special(name)
{
	switch (name)
	{
		case "Aggressive":
			return {
				name:		name,
				icon:		0,
				tooltip:	create_tooltip_element(noone, 0, 0, 8, 8, "^rAggressive^n^wThis enemy will attack^nwhen you use an item.")
			}
			break;
	}
}