extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	GameManager.mouseEnterPot()


func _on_mouse_exited() -> void:
	GameManager.mouseExitPot()
