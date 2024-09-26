extends Control

var new_scale: float = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		pause_or_unpause()
		
		position = Vector2 (550, 300)
		scale = Vector2(new_scale, new_scale)
		
func pause_or_unpause():
	if get_tree().paused == true:
		$".".hide()
		get_tree().pause = false
	elif get_tree().pause == false:
		$".".hide()
		get_tree().pause = true
	
	

func _on_button_pressed() -> void:
	pass # Replace with function body.
