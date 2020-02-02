extends Node

onready var spawners := $Spawners

var crap = preload("res://scenes/Tool.tscn")
var num_craps : int = GameData.num_of_craps
const MAX_ANGLE := PI/4

func _ready() -> void:
	randomize()
	$Timer.wait_time = GameData.time_between_craps
	$Player.start_falling_scene()
# warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "_on_timeout")
	$Timer.start()

func _on_timeout() -> void:
	if num_craps == 0:
		GameData.num_of_craps += 2
		num_craps = GameData.num_of_craps
		EventManager.emit_signal("next_level")
# warning-ignore:narrowing_conversion
		SceneManager.change_scene("res://scenes/Level%s.tscn" % GameData.actual_level,0.1)
		set_physics_process(false)
		return
	var t = crap.instance()
	var pos = randi()%spawners.get_child_count()
	t.global_position = spawners.get_child(pos).global_position
	t.dir = t.dir.rotated(choose_angle(pos))
	add_child(t)
	num_craps -= 1

func choose_angle(pos: int)-> float:
	match pos:
		0:
			return rand_range(0.0,MAX_ANGLE)
		1:
			return rand_range(-MAX_ANGLE/3.0, MAX_ANGLE/3.0)
		_:
			return rand_range(0.0, -MAX_ANGLE)
	
