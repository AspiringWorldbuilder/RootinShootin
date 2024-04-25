extends Node2D

@onready var pause_menu = get_node("/root/MainGame/PauseMenu")

var paused = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide()

func pause():
	if get_tree().paused:
			get_tree().paused = false
			pause_menu.hide()
	else:
		get_tree().paused = true
		pause_menu.show()
	print(paused)

func quit():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pause()


