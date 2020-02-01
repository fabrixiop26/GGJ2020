extends "res://scripts/State.gd"

func enter()->void:
	host.vector_snap = Vector2.DOWN * 16
func update(_delta: float) -> void:
	host.dir.x = update_direction()
	if host.dir.x == -1:
		host.change_sprite(3)
	if host.dir.x == 1:
		host.change_sprite(2)
#	if host.is_on_floor():
#		host.velocity.y = 0
#	else:
	if host.velocity.y > 0.1 and !host.is_on_floor():
		emit_signal("terminated", "Fall")
	host.apply_gravity(_delta)
	if host.dir.x==0 and host.is_on_floor():
		emit_signal("terminated", "Idle")
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide_with_snap(host.velocity, host.vector_snap, Vector2.UP)
#	host.dir = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("w") and host.is_on_floor():
		emit_signal("terminated", "Jump")

func update_direction()->int:
	return (int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a")))
