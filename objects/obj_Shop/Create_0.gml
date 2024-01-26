/// obj_Shop : Init

event_inherited();


create_tooltip_element(id, x + 16, y + 3, 17, 8, "Purchase items^nusing ^rgems^w.");

manager = noone;	// Really don't want to give reverse control of the whole manager object but whatever


// Item pool
items = ["Potion", "Ether", "Bomb"];
rareItems = ["Elixir"];
tomes = ["Tome of Weakening", "Tome of Healing"];

// Select items
offers = [
	create_item(items[irandom_range(0, array_length(items) - 1)]		),
	create_item(items[irandom_range(0, array_length(items) - 1)]		),
	create_item(items[irandom_range(0, array_length(items) - 1)]		),
	create_item(rareItems[irandom_range(0, array_length(rareItems) - 1)]),
	create_item(tomes[irandom_range(0, array_length(tomes) - 1)]		),
	create_item(tomes[irandom_range(0, array_length(tomes) - 1)]		)
];