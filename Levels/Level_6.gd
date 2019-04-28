extends "res://Levels/Level.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_hp = 9
var level_text = "Sometimes the longest way the wisest one."
func _ready():
	size = 6
	Grid = get_node("Grid")
	player = Grid.get_node("Player")

	player.hp = player_hp
	next_stage = "res://Levels/end.tscn"
	Grid.init_object(power_source,Vector2(3,0))
	Grid.init_object(blocked,Vector2(2,0))
	Grid.init_object(water,Vector2(1,0))
	Grid.init_object(blocked,Vector2(2,1))
	Grid.init_object(water,Vector2(1,1))
	Grid.init_object(blocked,Vector2(2,2))
	Grid.init_object(water,Vector2(1,2))