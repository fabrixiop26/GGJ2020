extends Node2D

onready var path_follow := $Path2D/PathFollow2D

func _ready() -> void:
	randomize()
	var speed = rand_range(2.5, 3.5)
	$Anim.playback_speed = speed

func _process(delta: float) -> void:
	if path_follow.offset > 0 and path_follow.offset <= 5:
		$Anim.playback_speed = rand_range(2.5, 3.5)
