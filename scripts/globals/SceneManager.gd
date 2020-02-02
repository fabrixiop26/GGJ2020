extends CanvasLayer

onready var anim := $Anim

func _ready() -> void:
	EventManager.connect("next_level", self, "_on_next_level")
	EventManager.connect("game_finished", self, "_on_game_finished")

func change_scene(path: String, delay:int=0.5)->void:
	yield(get_tree().create_timer(delay), "timeout")
	anim.play("FadeIn")
	yield(anim,"animation_finished")
	var err = get_tree().change_scene(path)
	print(err)
	anim.play_backwards("FadeIn")
	yield(anim,"animation_finished")

func _on_next_level()-> void:
	GameData.actual_level += 1

func _on_game_finished()->void:
	change_scene("res://scenes/GameFinished.tscn", 0.2)
