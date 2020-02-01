extends "res://scripts/State.gd"

func enter()->void:
	host.get_node("Anim").play("Salto")
	host.velocity.y =host.jump_speed
	host.has_double_jumpled = true

func update(_delta: float)->void:
	host.dir.x = update_direction() * GameData.inversor
	if host.velocity.y > 0.1 :
		emit_signal("terminated", "Fall")
	host.velocity.x = host.dir.x * host.speed
	host.velocity = host.move_and_slide(host.velocity, Vector2.UP)
	host.apply_gravity(_delta)

func update_direction()->int:
	return int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
