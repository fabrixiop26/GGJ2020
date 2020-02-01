extends "res://scripts/State.gd"

class_name FallingState

func enter()->void:
	pass

func update(_delta: float)->void:
	host.dir.x = update_direction()
	host.dir = host.dir.normalized()
	host.velocity.x = host.dir.x * host.speed	
	host.apply_gravity(_delta)
	if Input.is_action_pressed("w"):
		host.velocity.y = host.jump_speed / 2
	host.velocity = host.move_and_slide(host.velocity)
	host.dir.y = 0

func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
