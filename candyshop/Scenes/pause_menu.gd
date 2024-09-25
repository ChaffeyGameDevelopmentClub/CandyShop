extends Control

#var new_scale: float = 1

		#position = Vector2 (550, 300)
		#scale = Vector2(new_scale, new_scale)
		
func _ready() -> void:
	self.process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _process(delta: float) -> void:
	if get_tree().paused:
		print('other show')
		self.show()




func _on_timer_timeout() -> void:
	pass # Replace with function body.
