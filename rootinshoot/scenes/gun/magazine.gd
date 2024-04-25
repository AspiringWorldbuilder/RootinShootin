class_name Magazine extends Resource

@export var max_bullets = 1
@export var ammo_left = 0
@export var reload_time = 0.1
var timer: Timer

func _init(capacity, reload):
	max_bullets = capacity
	ammo_left = capacity
	reload_time = reload
