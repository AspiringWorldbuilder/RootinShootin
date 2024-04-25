extends Node2D

@onready var held_item = get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _input(event):
	#if event.is_action("shoot"):
		#held_item.activate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("reload"):
		held_item.reload()
	elif Input.is_action_pressed("shoot"):
		held_item.activate()
	
	look_at(get_global_mouse_position())
	
	#when item is pointing up, my_rot is at 0 roation. also keep rotation value between 0 to TAU
	var my_rot = rotation + PI/2
	if my_rot > TAU:
		rotation -= TAU
	elif my_rot < 0:
		rotation += TAU
	
	#flip sprite depending on rotation
	if my_rot > PI:
		held_item.scale.y = -1
	else:
		held_item.scale.y = 1
	

