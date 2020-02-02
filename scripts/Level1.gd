extends Node2D

func _ready() -> void:
	SoundManager.change_music(GameData.level_music)
	SoundManager.play()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		SceneManager.change_scene("res://scenes/FallingScene.tscn",0.2)
