extends Node2D

var size = 4

var player

onready var Player_scene = preload("res://Player/Player.tscn")
onready var Grid


onready var power_source = preload("res://Power_source.tscn")
onready var blocked = preload("res://Block/Blocked.tscn")
onready var water = preload("res://Water/Water.tscn")
onready var bridge = preload("res://Bridge/Bridge.tscn")

var next_stage = "res://Levels/Level1.tscn"

func _ready():
	Grid = get_node("Grid")
	player = get_node("Player")
	pass # Replace with function body.


func end_level():
	get_tree().change_scene(next_stage)
	
func restart():
	get_tree().reload_current_scene()
	pass