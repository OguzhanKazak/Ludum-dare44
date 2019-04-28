extends TileMap

var tile_size = get_cell_size()
var half_tile_size = get_cell_size()/2

var grid_size = Vector2()
var grid = []

var level

onready var tile = preload("res://Floor.tscn")
onready var border = preload("res://Block/Blocked.tscn")

func _ready():
	
	level = get_parent()
	var size = level.size
	print(level.name)
	grid_size = Vector2(size,size)
	
	var screen_size = get_viewport_rect().size
	var tilemap_pos = Vector2(screen_size.x/2 - half_tile_size.x*size,screen_size.y/2 - half_tile_size.y*size)
	print(tilemap_pos)
	set("position",tilemap_pos)
	
	

	
	for x in range(grid_size.x):
		grid.append([]) #empty array of rows
		for y in range(grid_size.y):
			grid[x].append(null)
			
	var player = get_node("Player")
	var start_pos = update_child_position(player)
	player.set_position(start_pos)
 #TO İNSTANTİATE İN GRİD
	var positions = []
	for x in range(grid.size()):
		for y in range(grid.size()):
			var grid_pos = Vector2(x,y)
			positions.append(grid_pos)
#instantiate tiles
	for pos in positions:
		var tile_instance = tile.instance()
		tile_instance.z_index = -1
		tile_instance.set_position(map_to_world(pos) + half_tile_size)
		grid[pos.x][pos.y] = null
		add_child(tile_instance)

func is_cell_empty(player_pos,player_direction):
	var grid_pos = world_to_map(player_pos)+player_direction
	if(grid_pos.x < grid_size.x and grid_pos.x >=0):
		if(grid_pos.y < grid_size.y and grid_pos.y >=0):
			return grid[grid_pos.x][grid_pos.y]
	return border.instance()
	
func update_child_position(child_node):
	#childrens send their position and this func maps to grid pos
	var grid_pos = world_to_map(child_node.get_position())
	var new_grid_pos = grid_pos + child_node.direction
	var target_pos = map_to_world(new_grid_pos)+half_tile_size
	child_node.lose_hp()
	
	return target_pos

func init_object(object_scene,pos):
	var object_instance = object_scene.instance()
	object_instance.set_position(map_to_world(pos) + half_tile_size)
	grid[pos.x][pos.y] = object_instance
	add_child(object_instance)
	