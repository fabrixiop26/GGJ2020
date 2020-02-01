extends Node

var sound_player := AudioStreamPlayer.new()

func _ready() -> void:
	add_child(sound_player)

func change_music(_music : String)->void:
#	sound_player.stream = _music
	pass

func play()->void:
	sound_player.play()
