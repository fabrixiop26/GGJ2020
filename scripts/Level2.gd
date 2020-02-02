extends Node2D

func _ready() -> void:
	SoundManager.change_music(GameData.level_music)
	SoundManager.play()
	var p = GameData.player_scene.instance()
	p.global_position = $Spawner.global_position
	add_child(p)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		SceneManager.change_scene("res://scenes/FallingScene.tscn",0.2)
