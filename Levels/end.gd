extends "res://Levels/Level.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_hp = 9
var level_text = "Thanks for playing i couldn't manage to finished the game. But this is my first time in Ludum Dare so.. It's ok!"

func _ready():
	Grid = get_node("Grid")
	player = Grid.get_node("Player")

	player.hp = player_hp
	next_stage = "res://Levels/end.tscn"
	Grid.init_object(blocked,Vector2(2,0))
	Grid.init_object(blocked,Vector2(1,1))
	Grid.init_object(blocked,Vector2(2,2))
	Grid.init_object(blocked,Vector2(3,1))
	Grid.init_object(water,Vector2(2,1))
	