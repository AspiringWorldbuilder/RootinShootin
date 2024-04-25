class_name Player extends CharacterBody2D


const SPEED = 100.0
const MAX_SPEED = 2000

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func push(pushed_velocity: Vector2):
	velocity = -pushed_velocity

func _physics_process(delta):
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity *= 0.95
	velocity += SPEED * direction
	velocity = velocity.limit_length(MAX_SPEED)
	
	var last_position = global_position
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		var collider = collision_info.get_collider()
		
		if collider.has_method("enemy"):
			collider.push(velocity)
			global_position -= (collider.global_position - global_position)
			collider.enemy().hurt(10)
			
		else:
			velocity = velocity.slide(collision_info.get_normal())*MAX_SPEED/2
	

	#TODO walking animation
	#if velocity.length_squared() > 0.0:
	#		
	#else
		
		
