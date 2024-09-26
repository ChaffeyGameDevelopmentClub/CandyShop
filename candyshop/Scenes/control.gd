extends Control

@export var color1 : Color
@export var color2 : Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print('timeout')
	if $ColorRect2.color == color1:
		$ColorRect2.color = color2
	else:
		$ColorRect2.color = color1
	
