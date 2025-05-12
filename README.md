# ArcadeTemplate
A description of the project
Adeline doesn’t need a plot
just a gun and something to jump off. 
This no-frills arcade platformer keeps things simple:
run, shoot, jump, repeat. 
Gameplay, stratigic action, and just enough polish to keep it all together. 
A compact burst of fun' for when you’ve got a friend.



Reflections - res://Reflections
Documentation - THIS
Workflow - https://github.com/FranklinCentralHS/AdelinesEndlessDefense



Inheritance - res://Scripts/Enm1.gd
				res://Scripts/enmn2.gd
				``3
Encapsulation - res://Scrripts/platform.gd 
Polymorphism - res://Scripts/button.gd
				res://Scripts/platform
				res://Scripts/enemy_door/.gd
Abstraction - I can fathom a reason to use this but it was not a thing that was needed
	if in theory i wanted an item that buffes things that steap on it
	i could absttract a buffed function and use a custom signal passing
	through the thing the name of the thing to be buffed and then in a class 
	creature have a function buffed(): pass and then i could
	make the item tell the creature to run its buffed function
	
	or i could in the item have if body.get_parent() is ___:
			buff for that thing and repeat for each charictor that gets a buff.

Godot Features
Customm Signals - res://Scripts/global.gd
					res://Scripts/door.gd
					res://Scripts/button.gd

Controls
1 - res://Scripts/player.gd
2 - res://Scripts/pick_letter.gd

UI
Healthbars - res://scenes/game.tscn
Leaderboard? - res://scenes/leaderboard.tscn

Leaderboard
Storage - res://Scripts/leaderboard.gd
List top 10 - res://Scripts/leaderboard_show.gd
Imputs w/ disalow - res://Scripts/pick_letter.gd

-The overarching roles each team member played and the big picture items they contributed
Peyton - [
	player art
	level inspioration
]
Caden - [
	all the code - {
		Players
		Levels
		Enemies
		Leaderboard
		UI
	}
	a good portion of the documentation
	the README
	Level design
	mechanic ideas
]
Emma - [
	Github webside orginisation
]
Logan - [
	Added to the project proposal
]
A link to a project Google drive where any files external to the game itself can be found (with access granted to the teacher)
 caden - I dont know wahat this would be.
