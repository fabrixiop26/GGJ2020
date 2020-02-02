extends "res://scripts/State.gd"

func enter()->void:
	host.vector_snap = Vector2.ZERO

func update(_delta: float)->void:
	if host.is_on_floor():
		emit_signal("terminated", "Idle")
	if Input.is_action_pressed("w") and !host.has_double_jumpled:
		host.has_double_jumpled = true
		emit_signal("terminated", "DoubleJump")
	host.apply_gravity(_delta)
	host.dir.x = update_direction() * GameData.inversor
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide_with_snap(host.velocity, host.vector_snap,Vector2.UP)
	
func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
