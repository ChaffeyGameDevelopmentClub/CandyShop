extends Control
@export var dialogueArray : DialogueArray
@export var textLabel : RichTextLabel
@export var timer : Timer
@export var Customer : Sprite2D

var itemName
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass#orderStart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var npc
func orderStart():
	#print('orderStart')
	#how many npcs we have in Dialogue Array
	npc = randi_range(0,1)
	#print(npc)
	var name = dialogueArray.npc_array[npc].Name
	var arrayamount = dialogueArray.npc_array[npc].text.size()
	var npcName = dialogueArray.npc_array[npc].Name
	playText()
	#print_debug("orderStart Done")
	return npcName
	
var i = 0
var arrayamount
func playText():
	#print_debug('playText')
	arrayamount = dialogueArray.npc_array[npc].text.size()
	#print_debug(arrayamount)
	print_debug(i)
	var text
	
	#print(i)
	if arrayamount > i and !arrayamount-1 == i:
		text = dialogueArray.npc_array[npc].text[i]
		#print_debug(text)
		textLabel.text = text
		timer.start()
		#print
		i += 1
	elif arrayamount-1 == i:
		text = dialogueArray.npc_array[npc].text[i]
		textLabel.text = text + itemName
		Customer.dialogueEnd()
		#print(str(i) + " arrayamount")
		i = 0
func sendToDialogue(itemName1):
	itemName = itemName1

func completeOrder():
	textLabel.text = "yummers"

func failedOrder():
	textLabel.text = "you failed me"

func _on_dialogue_timer_timeout() -> void:
	print_debug('timeout')
	playText()


func _on_dialogue_start_timer_timeout():
	orderStart()
