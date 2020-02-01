extends KinematicBody2D

onready var sprite := $Sprite
onready var anim := $Anim
onready var timer := $Timer

onready var state_machine := StateMachine.new(self, $States, $States/Idle)

var alive = true
var dir := Vector2.ZERO
export(int) var speed
var velocity := Vector2.ZERO
var vector_snap := Vector2.DOWN * 32
var jumping := false
const GRAVITY = 500
var jump_speed = -230
var has_double_jumpled := false
var anim_string : String
var time : int = 10

func _ready() -> void:
	GameData.player = self
	EventManager.emit_signal("update_timer", time)

func _physics_process(delta: float)->void:
	state_machine.run(delta)

func apply_gravity(_delta: float)->void:
	velocity.y += GRAVITY * _delta

func change_sprite(_value: int)->void:
	sprite.frame = _value

func add_time(_time : float)->void:
	time += _time
	EventManager.emit_signal("update_timer", time)

func _on_Timer_timeout() -> void:
	time -= 1
	if time <= 0:
		return
		queue_free()
	else:
		EventManager.emit_signal("update_timer", time)
