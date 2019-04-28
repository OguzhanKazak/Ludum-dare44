extends "res://Levels/Level.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_hp = 7
var level_text = "You'll lose a charge for your any movement"
func _ready():
	size = 4 
	Grid = get_node("Grid")
	player = Grid.get_node("Player")

	player.hp = player_hp
	next_stage = "res://Levels/Level_2.tscn"
	Grid.init_object(power_source,Vector2(3,3))
