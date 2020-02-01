extends "res://scripts/State.gd"

func enter()->void:
	host.vector_snap = Vector2.DOWN * 16
	host.has_double_jumpled = false
	host.change_sprite(0)

func update(_delta: float)->void:
	if host.velocity.y > 0.1 and !host.is_on_floor():
		emit_signal("terminated", "Fall")
	host.dir.x = update_direction() * GameData.inversor
	host.apply_gravity(_delta)
	if host.dir.x != 0 and host.is_on_floor():
		emit_signal("terminated","Run")
	if Input.is_action_pressed("w") and host.is_on_floor():
		emit_signal("terminated", "Jump")
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide_with_snap(host.velocity, host.vector_snap,Vector2.UP)


func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
