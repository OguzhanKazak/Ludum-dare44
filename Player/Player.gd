extends KinematicBody2D

var textures = []
onready var move0 = load("res://Player/player_0.png")
onready var move1 = load("res://Player/player_1.png")

var hp = 7

const UP = Vector2(0,-1)
const DOWN = Vector2(0,1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)

var direction = Vector2()

export var MAX_SPEED = 400
var speed = 0
var velocity = Vector2()

onready var grid
onready var level
var type

var is_moving = false
var can_move = true
var target_pos = Vector2()
var target_direction = Vector2()

func _ready():
	level = get_parent().get_parent()
	grid = get_parent()
	type = "PLAYER"
	set_physics_process(true)
	textures.append(move0)
	textures.append(move1)

func _physics_process(delta):
	direction = Vector2()

	if(Input.is_action_pressed("ui_down")):
		direction = DOWN
		change_sprite_on_move()
		
	elif(Input.is_action_pressed("ui_up")):
		direction = UP
		change_sprite_on_move()
		
	elif(Input.is_action_pressed("ui_right")):
		direction = RIGHT
		change_sprite_on_move()
		
	elif(Input.is_action_pressed("ui_left")):
		direction = LEFT
		change_sprite_on_move()
		
	elif(Input.is_action_just_pressed("ui_restart")):
		level.restart()
		
	if(not is_moving and direction != Vector2()):
		target_direction = direction
		var target_cell = grid.is_cell_empty(get_position(),target_direction)

		if(target_cell == null or target_cell.type == "BRIDGE"):
			target_pos = grid.update_child_position(self)
			is_moving = true
		
		elif(target_cell.type == "POWER"):
			target_pos = grid.update_child_position(self)
			is_moving = true
			level.end_level()

		elif(target_cell.type == "BLOCKED"):
			pass
			
		elif(target_cell.type == "WATER"):
			target_pos = grid.update_child_position(self)
			is_moving = true
			lose_hp()
			
	elif(is_moving && can_move):
		speed = MAX_SPEED
		velocity = speed * target_direction * delta
		
		var pos = get_position()
		var distance = Vector2(abs(target_pos.x-pos.x),abs(target_pos.y-pos.y))
		
		if(abs(velocity.x) > distance.x):
			velocity.x = distance.x * target_direction.x
			is_moving = false
		if(abs(velocity.y) > distance.y):
			velocity.y = distance.y * target_direction.y
			is_moving = false
		move_and_collide(velocity)
		
func lose_hp():
	var UI = get_parent().get_node("Control")
	UI.lose_hp()
	hp-=1
	if(hp == 0):
		get_node("Sprite").queue_free()
		can_move = false
	
func change_sprite_on_move():
	var texture = get_node("Sprite")
	if(texture != null):
		if(texture.texture == textures[0]):
			texture.texture = textures[1]
		else:
			texture.texture = textures[0]

	

