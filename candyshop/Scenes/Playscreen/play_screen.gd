extends Node2D

@export var camera: Camera2D  
var target_position: Vector2
var customers = 5
var sell = 0
var miss  = 0



func _ready():
	target_position = camera.position  

func front_pressed():
	target_position.x -= 1922 

func back_pressed():
	target_position.x += 1922  

func _process(delta):
	camera.position = camera.position.lerp(target_position, 0.1)
	if (sell+miss == customers):
		if (sell >= 3):
			pass




func _on_sell_button_down() -> void:
	pass
	
