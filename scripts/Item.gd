extends Area2D
class_name Item

var power : String

func _ready() -> void:
	power = "+10"
	$Anim.play("anim")

func _on_Item_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		ItemMananger.make_effect(power)
		queue_free()
