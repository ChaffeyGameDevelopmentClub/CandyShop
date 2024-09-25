extends Control
@export var plantType : String
@export var pot: TextureRect
@export var sprout: TextureRect
@export var plant: TextureRect
@export var growingTimer: Timer
@export var rottingTimer: Timer
@export var sproutTexture : Texture
@export var plantTexture : Texture
@export var GrotProgress: ProgressBar
@export var growColor: Color
@export var rotColor: Color
@export var clickedColor:Color

var grotSwitch = true
var Chocolate = 1
var growing = true
var rotting = false
var collected = false



func collecting():
	if (collected == true): # if the varible for when it's clicked is true then do ...
			addToStorage(plantType)
			#print("collected")
			#print(Chocolate)
			growingTimer.wait_time = randi_range(4,8)

func addToStorage(nameOf):
	GameManager.send_Amount(nameOf)

func resetTimer():
	rottingTimer.stop()
	rottingTimer.wait_time = 8 #set this to what is on rotting timer node
	
	# *resets the timer when it's collected

func switchSprite():
	plant.visible = false
	sprout.visible = false
	#*makes both sprites hiden then showing correct one
	
	
	if (growing == true):
		growingTimer.start()
		#GrotProgress.max_value = growingTimer.time_left
		GrotProgress.set_deferred("self_modulate",growColor)
		grotSwitch = true
		sprout.visible = true
		#print("growing")
		#print(collected)
		#*if the pot should be growing starts the timer then shows the sprite
	elif(rotting == true):
		rottingTimer.start()
		GrotProgress.set_deferred("self_modulate",rotColor)
		grotSwitch = false
		plant.visible = true
		#print('rotting')
		#*if the pot should be rotting starts the timer then shows the sprite
func _on_rotting_timer_timeout():
	#print("rotting timer")
	rotting = false #\ changes states by switching the varables from false and true 
	growing = true	#/ then goes into switchsprite functaion with new varavbles
	switchSprite()

func _on_growing_timer_timeout(): 
	#print('growing timer')
	growing = false #\ changes states
	rotting = true  #/
	switchSprite()

func _process(delta: float) -> void:
	if grotSwitch: 
		GrotProgress.value += (100/growingTimer.wait_time) * delta
		#print(growingTimer.wait_time)
		
	elif not grotSwitch:
		GrotProgress.value -= (100/rottingTimer.wait_time) * delta
func _ready(): # to start everything
	switchSprite() 
	sprout.texture = sproutTexture
	plant.texture = plantTexture


func _on_collect_button_button_down():
	if (rotting == true): # so if it's in rotting state it can collect
		#print("can collect") 
		collected = true  # to prevent spaming to earn more might not be needed idk lol
		rotting = false #\ - changing states
		growing = true  #/
		
		GrotProgress.set_deferred("self_modulate",clickedColor)
		GrotProgress.value = 0
		
		collecting() 
		resetTimer() # with out restarting timer it will bug out
		switchSprite() 
	else:
		#print("can't collect yet")
		pass
func _on_collect_button_button_up() -> void:
	
	collected = false #again to prevent spaming
	#print("done" + str(collected))
