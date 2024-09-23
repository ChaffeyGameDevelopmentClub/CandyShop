extends Control

@export var pot: Sprite2D
@export var sprout: Sprite2D
@export var plant: Sprite2D
@export var growingTimer: Timer
@export var rottingTimer: Timer

var Chocolate
var growing = true
var rotting = false
var collected = false

func addToStorage(nameOf):
	GameManager.send_Amount(nameOf)

func switchSprite():
	if (growing == true):
		sprout.visible = true
		growingTimer.start()
	elif(rotting == true):
		plant.visible = true
		rottingTimer.start()
		if (collected == true):
			print("cool")
			collected == false
			
			addToStorage(Chocolate)
	


func _on_growing_timer_timeout():
	growing = false
	rotting = true
	sprout.visible = false
	switchSprite()
	
func _on_rotting_timer_timeout():
	rotting =false
	growing = true
	plant.visible = false
	switchSprite()
	

func _ready():
	switchSprite()


func _on_collect_button_button_down():
	print("worked")
	collected = true
