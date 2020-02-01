extends Area2D

var dir := Vector2.UP

func _on_Crap_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		EventManager.emit_signal("player_hurt")
		queue_free()

func _physics_process(delta: float) -> void:
	global_position.y += dir.y * 400 * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if global_position.y + $CollisionShape2D.shape.extents.y < 0:
		print("Crap deleted")
		queue_free()
