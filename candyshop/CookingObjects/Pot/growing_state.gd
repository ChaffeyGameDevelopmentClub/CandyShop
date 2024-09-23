extends State

class_name GrowingState

func _ready() -> void:
	print("pls")
	sprout.visible = true


func _on_grow_timer_timeout() -> void:
	print("done")
	sprout.visible = false
