extends State

class_name GrowingState
@export var rotting_state :State

func bleh():
	print("pls")
	sprout.visible = true
	plant.visible = false

func _on_grow_timer_timeout() -> void:
	print("done")
	sprout.visible = false
	next_state = rotting_state

func _ready() -> void:
	bleh()
