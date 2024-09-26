extends Control

@export var buttonsound:AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_play_button_pressed() -> void:
	buttonsound.play()
	#get_tree().change_scene_to_file("res://Scenes/shop_screen.tscn")


func _on_options_button_pressed() -> void:
	buttonsound.play()
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_quit_button_pressed() -> void:
	buttonsound.play()
	get_tree().quit()
