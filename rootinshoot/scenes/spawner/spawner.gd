extends Node2D

@export var count = 1
@export var time = 0.1
@export var spawn: Resource

@onready var area = get_child(0).shape.size/2
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.wait_time = time
	timer.connect("timeout", _spawn)
	
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn():
	if count == 0:
		queue_free()
		return
	var x = global_position.x + randf_range(-area.x, area.x)
	var y = global_position.y + randf_range(-area.y, area.y)
	var scene = spawn.instantiate()
	scene.global_position = Vector2(x, y)
	add_sibling(scene)
	count -= 1
	
