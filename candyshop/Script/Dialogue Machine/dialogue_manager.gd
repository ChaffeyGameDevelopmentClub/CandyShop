extends Control
@export var dialogueArray : DialogueArray
@export var textLabel : RichTextLabel
@export var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass#orderStart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var npc
func orderStart():
	print('orderStart')
	#how many npcs we have in Dialogue Array
	npc = randi_range(0,1)
	print(npc)
	var name = dialogueArray.npc_array[npc].Name
	var arrayamount = dialogueArray.npc_array[npc].text.size()
	playText()
	
var i = 0
func playText():
	print('playText')
	var arrayamount = dialogueArray.npc_array[npc].text.size()
	var text
	
	print(i)
	if arrayamount > i:
		text = dialogueArray.npc_array[npc].text[i]
		textLabel.text = text
		timer.start()
		print
		i += 1
	elif arrayamount-1 < i:
		get_tree().current_scene.get_node("ShopScreen").get_node("Customer").dialogueEnd()
		print(str(i) + " arrayamount")
		i = 0

func completeOrder():
	textLabel.text = "yummers"

func _on_dialogue_timer_timeout() -> void:
	print('timeout')
	playText()


func _on_dialogue_start_timer_timeout():
	orderStart()
