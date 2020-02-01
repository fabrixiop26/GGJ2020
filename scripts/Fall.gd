extends "res://scripts/State.gd"

func enter()->void:
	pass

func update(_delta: float)->void:
	if host.is_on_floor():
		emit_signal("terminated", "Idle")
	if Input.is_action_pressed("w") and !host.has_double_jumpled:
		host.has_double_jumpled = true
		emit_signal("terminated", "DoubleJump")
	host.apply_gravity(_delta)
	host.dir.x = update_direction()
	if host.dir.x == -1:
		host.change_sprite(3)
	if host.dir.x == 1:
		host.change_sprite(2)
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide(host.velocity,Vector2.UP)
	
func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
