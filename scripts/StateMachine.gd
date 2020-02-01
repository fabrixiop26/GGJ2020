extends Node
class_name StateMachine

var host
var current_state : Node
var states := {}

func _init(_host, state_parent: Node, _initial : Node)->void:
	self.host = _host
	for state in state_parent.get_children():
		states[state.name] = state
		state.host = _host
		state.connect("terminated", self, "_on_state_changed")
		state.connect("terminated", host.get_node("Label"), "change")
	current_state = _initial
	current_state.enter()

func run(_delta: float) -> void:
	if host.alive:
		current_state.update(_delta)

func _on_state_changed(_new_state: String)->void:
	if current_state.name != _new_state:
		current_state.exit()
		current_state = states[_new_state]
		current_state.enter()
