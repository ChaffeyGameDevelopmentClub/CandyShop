extends Node2D

@export var customers:int
@export var camera: Camera2D  
var target_position: Vector2
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
			#print("won")
			get_tree().change_scene_to_file("res://Scenes/DaySystem/Levels/level_1.tscn")
		elif (sell<3):
			#print("lost")
			get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")




func _on_sell_button_down() -> void:
	sell += 1
	#print(customers)
	


func _on_miss_button_down() -> void:
	miss += 1
