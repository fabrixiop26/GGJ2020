extends Label

func _ready() -> void:
	EventManager.connect("update_timer", self, "_on_time_update")
	
func _on_time_update(_time: int)->void:
		self.text = str(_time)
