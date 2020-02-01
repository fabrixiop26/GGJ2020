extends "res://scripts/State.gd"

var time : float = 0.0

func enter()->void:
	host.velocity.y = host.jump_speed

func update(_delta: float)->void:
	time += _delta
	host.dir.x = update_direction()
	if host.dir.x == -1:
		host.change_sprite(3)
	if host.dir.x == 1:
		host.change_sprite(2)
	if host.velocity.y > 0 :
		emit_signal("terminated", "Fall")
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide(host.velocity, Vector2.UP)
	host.apply_gravity(_delta)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("w") and time >= 0.04:
		emit_signal("terminated", "DoubleJump")

func exit()->void:
	time = 0.0

func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
