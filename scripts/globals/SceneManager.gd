extends CanvasLayer

onready var anim := $Anim

func change_scene(path: String, delay:int=0.5)->void:
	yield(get_tree().create_timer(delay), "timeout")
	anim.play("FadeIn")
	yield(anim,"animation_finished")
	assert(get_tree().change_scene(path) == OK)
	anim.play_backwards("FadeIn")
	yield(anim,"animation_finished")
