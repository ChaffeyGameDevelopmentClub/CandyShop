extends Control

func _on_texture_button_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($AudioOptions/Control/overall/overallslider.value * 0.1))
	AudioServer.set_bus_volume_db(1, linear_to_db($AudioOptions/Control/overall/overallslider.value* 0.1))
	AudioServer.set_bus_volume_db(2, linear_to_db($AudioOptions/Control/overall/overallslider.value* 0.1))


func _on_back_pressed() -> void:
	self.hide()
