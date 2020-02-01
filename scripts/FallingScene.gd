extends Node

onready var spawners := $Spawners

var crap = preload("res://scenes/Tool.tscn")

func _ready() -> void:
	randomize()
	$Player.start_falling_scene()
	$Timer.connect("timeout", self, "_on_timeout")
	$Timer.start()

func _on_timeout() -> void:
	var t = crap.instance()
	t.global_position = spawners.get_child(randi()%spawners.get_child_count()).global_position
	add_child(t)
	
