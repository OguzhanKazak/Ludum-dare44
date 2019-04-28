extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var level = get_parent().get_parent()
onready var player = get_parent().get_node("Player")
onready var heart_image = load("res://HEART.png")

var health = []

func _ready():
	var info_text = get_node("LineEdit")
	var level_text = get_node("Level_text")
	level_text.text = level.level_text
	level_text.set("rect_position", Vector2(info_text.rect_position.x-250,info_text.rect_position.y -100))
	info_text.set("rect_position", Vector2(info_text.rect_position.x,info_text.rect_position.y -50))
	var pos = 0
	for i in range(level.player_hp+1):
		var texture = TextureRect.new()
		texture.texture = heart_image
		texture.set_position(Vector2(pos,texture.rect_position.y-25))
		add_child(texture)
		health.append(texture)
		pos += 16

func _process(delta):
	pass
	
func lose_hp():
	var texture = health.pop_back()
	texture.queue_free()

