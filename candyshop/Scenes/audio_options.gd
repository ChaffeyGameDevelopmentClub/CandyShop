extends Control

func _ready():
	$Control/overall/overallslider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) * 0.001
	$Control/music/musicslider.value = db_to_linear(AudioServer.get_bus_volume_db(1)) * 0.001
	$Control/sfx/sfxslider.value = db_to_linear(AudioServer.get_bus_volume_db(2)) * 0.001
	
	

func _on_overallslider_mouse_exited() -> void:
	release_focus()



func _on_musicslider_mouse_exited() -> void:
	release_focus()


func _on_sfxslider_mouse_exited() -> void:
	release_focus()
