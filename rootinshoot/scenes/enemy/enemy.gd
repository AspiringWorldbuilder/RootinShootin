class_name Enemy extends Resource

var health = 1
var max_health = 1
var parent: Node

func _init(new_parent, m_h):
	max_health = m_h
	health = m_h
	parent = new_parent

func hurt(damage):
	health -= damage
	if health <= 0:
		parent.queue_free()

