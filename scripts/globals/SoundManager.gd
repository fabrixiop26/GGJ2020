extends Node

var sound_player := AudioStreamPlayer.new()

func _ready() -> void:
	add_child(sound_player)

func change_music(_music)->void:
	sound_player.stream =  _music

func play()->void:
	sound_player.play()
