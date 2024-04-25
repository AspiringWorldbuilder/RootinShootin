extends CharacterBody2D

@export var bullet: Resource
@export var shot_delay = 0.1
@onready var barrel_end = get_node("barrel_end")
@onready var shot_timer = get_node("shot_timer")
@onready var reload_timer = get_node("reload_timer")

var mag = Magazine.new(10, 1.0)
var holdable = true
# whether the gun is ready to fire
var chambered = true;

func activate():
	if chambered:
		var bul = bullet.instantiate()
		bul.linear_velocity = Vector2.RIGHT.rotated(get_parent().rotation) * 1000
		bul.global_position = barrel_end.global_position
		get_tree().current_scene.add_child(bul)
		chambered = false
		shot_timer.start()

func reload():
	reload_timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	shot_timer.wait_time = shot_delay
	reload_timer.wait_time = mag.reload_time
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _chamber():
	# if there is a magazine, put bullets from the magazine into the chamber
	if mag:
		if mag.ammo_left > 0:
			chambered = true
		mag.ammo_left -= 1

func _finish_reload():
	mag.ammo_left = mag.max_bullets
	shot_timer.start()

