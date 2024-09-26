extends ColorRect
@export var NextButton : Button
@export var ServeButton : Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _summonOrder():
	visible = true
	#NextButton.visible = true
	ServeButton.visible = true
	

func _hideOrder():
	visible = false
	#NextButton.visible = false
	ServeButton.visible = false
