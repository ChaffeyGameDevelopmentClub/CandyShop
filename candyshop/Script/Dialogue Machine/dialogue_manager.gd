extends Control
@export var dialogueArray : DialogueArray
@export var textLabel : RichTextLabel
@export var timer : Timer
@export var Customer : Sprite2D
@export var nameText : RichTextLabel
@export var walkOnTimer : Timer

var itemName
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass#orderStart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var npc
var npcName
func orderStart():
	#print('orderStart')
	#how many npcs we have in Dialogue Array
	npc = randi_range(0,12)
	#kenny only mode
	#npc = 8
	var name = dialogueArray.npc_array[npc].Name
	var arrayamount = dialogueArray.npc_array[npc].text.size()
	npcName = dialogueArray.npc_array[npc].Name
	nameText.text = npcName
	
	print_debug(npcName)
	
	Customer.texture = dialogueArray.npc_array[npc].image
	walkOnTimer.start()
	#print_debug("orderStart Done")
	return npcName
	
var i = 0
var arrayamount
func playText():
	
	#print_debug('playText')
	arrayamount = dialogueArray.npc_array[npc].text.size()
	#print_debug(arrayamount)
	#print_debug(i)
	var text
	
	#print(i)
	if arrayamount > i and !arrayamount-1 == i:
		text = dialogueArray.npc_array[npc].text[i]
		#print_debug('First')
		textLabel.text ='[center]' + text + '[/center]'
		timer.start()
		#print
		i += 1
	elif arrayamount-1 == i:
		text = dialogueArray.npc_array[npc].text[i]
		textLabel.text = '[center]' + text + itemName + '[/center]'
		Customer.dialogueEnd()
		timer.stop()
		#print(str(i) + " arrayamount")
		#print_debug('Second')
		i = 0
		
		
func sendToDialogue(itemName1):
	itemName = itemName1

func completeOrder():
	textLabel.text = '[center]' + "yummers" + '[/center]'

func failedOrder():
	textLabel.text = "you failed me"

func _on_dialogue_timer_timeout() -> void:
	#print_debug('timeout')
	playText()


func _on_dialogue_start_timer_timeout():
	orderStart()


func _on_walkon_timer_timeout() -> void:
	playText()
