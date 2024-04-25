extends RigidBody2D

func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	
func _physics_process(delta):
	var colliders = get_colliding_bodies()
	
	if !colliders.is_empty():
		var collider = colliders[0]
		if collider.has_method("enemy"):
			collider.push(linear_velocity)
			collider.enemy().hurt(10)
		queue_free()
			
func _despawn():
	queue_free()
