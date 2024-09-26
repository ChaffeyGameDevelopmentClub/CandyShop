extends Node2D

@export var camera: Camera2D  



var target_position: Vector2

func _ready():
	target_position = camera.position  


func _process(delta):
	camera.position = camera.position.lerp(target_position, 0.1)
	#pausemenu.position = camera.position.lerp(target_position, 0.1)

func _on_to_back_pressed() -> void:
	target_position.x += 1922  
	
func _on_to_front_pressed() -> void:
	target_position.x -= 1922
	
