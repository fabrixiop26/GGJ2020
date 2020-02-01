extends KinematicBody2D

onready var sprite := $Sprite
onready var anim := $Anim

onready var state_machine := StateMachine.new(self, $States, $States/Idle)

var alive = true
var dir := Vector2.ZERO
export(int) var speed
var velocity := Vector2.ZERO
var jumping := false
const GRAVITY = 500
var jump_speed = -180
var has_double_jumpled := false
var anim_string : String

func _physics_process(delta: float)->void:
	state_machine.run(delta)

func apply_gravity(_delta: float)->void:
	velocity.y += GRAVITY * _delta

func change_sprite(_value: int)->void:
	sprite.frame = _value
