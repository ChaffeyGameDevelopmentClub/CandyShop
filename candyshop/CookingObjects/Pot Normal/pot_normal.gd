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


func resetTimer():
	rottingTimer.stop()
	rottingTimer.wait_time = 5 #set this to what is on rotting timer node
	# resets the timer when it's collected

func switchSprite():
	plant.visible = false
	sprout.visible = false
	
	
	if (growing == true):
		growingTimer.start()
		sprout.visible = true
		print("growing")
	elif(rotting == true):
		rottingTimer.start()
		plant.visible = true
		print('rotting')
		if (collected == true):
			print("collected")
			collected = false
			
			addToStorage(Chocolate)
			print(Chocolate)
	


	
func _on_rotting_timer_timeout():
	print("rotting timer")
	rotting = false
	growing = true
	
	switchSprite()
	


func _on_growing_timer_timeout():
	print('growing timer')
	growing = false
	rotting = true
	
	switchSprite()


func _ready():
	switchSprite()


func _on_collect_button_button_down():
	if (rotting == true):
		print("can collect")
		collected = true
		rotting = false
		growing = true
		resetTimer()
		switchSprite()
		
	else:
		print("can't collect yet")
		
	



func _on_collect_button_button_up() -> void:
	print("done")
	collected = false
