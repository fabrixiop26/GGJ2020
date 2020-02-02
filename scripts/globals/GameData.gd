extends Node

var player_scene = preload("res://scenes/Player.tscn")
var level_music = preload("res://assets/audio/Ambiente (completa).wav")

var player
var inversor : int = 1
var num_of_craps : int = 3
var time_between_craps : float = 2.0
var actual_level := 1
