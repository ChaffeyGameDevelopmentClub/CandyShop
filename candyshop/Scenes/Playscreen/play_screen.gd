extends Node2D

@export var camera: Camera2D  
var target_position: Vector2

func _ready():
	target_position = camera.position  

func front_pressed():
	target_position.x -= 2000 

func back_pressed():
	target_position.x += 2000  

func _process(delta):
	camera.position = camera.position.lerp(target_position, 0.1)
