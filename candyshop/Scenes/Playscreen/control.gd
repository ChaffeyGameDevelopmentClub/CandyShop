extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('sendOut',sendTo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sendTo(name):
	print("yues yes :"+name)
	

func _on_color_rect_mouse_entered() -> void:
	#print('yes')
	GameManager.mouseEnterOut()


func _on_color_rect_mouse_exited() -> void:
	#print('no')
	GameManager.mouseExitOut()
