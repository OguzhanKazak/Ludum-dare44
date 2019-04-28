extends "res://Levels/Level.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_hp = 7
var level_text = "Choose the smartest way."
func _ready():
	size = 4 
	Grid = get_node("Grid")
	player = Grid.get_node("Player")

	player.hp = player_hp
	next_stage = "res://Levels/Level_6.tscn"
	Grid.init_object(power_source,Vector2(3,3))
	Grid.init_object(blocked,Vector2(0,1))
	Grid.init_object(blocked,Vector2(1,1))
	Grid.init_object(water,Vector2(2,1))
	Grid.init_object(water,Vector2(3,1))
	
	Grid.init_object(blocked,Vector2(0,2))
	Grid.init_object(blocked,Vector2(1,2))
	Grid.init_object(water,Vector2(3,2))