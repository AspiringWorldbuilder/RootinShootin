extends CharacterBody2D


@onready var player = get_node("/root/MainGame/Player")

const SPEED = 150.0

var info = Enemy.new(self, 10)

enum state 
{
	pushed,
	chasing
}

var my_state = state.chasing 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func push(pushed_velocity: Vector2):
	velocity = -pushed_velocity
	my_state = state.pushed
	
func _ready():
	var collision_info = move_and_collide(Vector2(0.01, 0.01), true)
	while collision_info:
		global_position -= collision_info.get_collider().global_position - global_position
		collision_info = move_and_collide(Vector2(0.01, 0.01), true)


func _physics_process(delta):
	match my_state:
		state.chasing:
			var direction = global_position.direction_to(player.global_position)
			velocity += SPEED * direction
		state.pushed:
			if velocity.length_squared() < 0.5:
				my_state = state.chasing
	
	velocity *= 0.75
	velocity.limit_length(300)
		
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		var collider = collision_info.get_collider()
		velocity = velocity.bounce(collision_info.get_normal()) * 2
		if collider is Player:
			collider.push(velocity)
			global_position -= (collider.global_position - global_position)/2

func enemy():
	return info
