extends Camera2D

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity *= 0.5
	var position_delta = get_parent().global_position - global_position
	global_position = get_parent().global_position - position_delta.limit_length(200)
