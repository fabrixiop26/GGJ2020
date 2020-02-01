extends Node

var powers = ["NoMusic","RJump","Switch", "+10", "MegaJump"]

func create_item()->void:
	pass

func make_effect(_power : String)->void:
	match _power:
		"+10":
			GameData.player.add_time(10)
