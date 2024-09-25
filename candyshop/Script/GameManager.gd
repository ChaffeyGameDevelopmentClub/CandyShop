extends Node

var index = 1
var amount
var hover
signal update_amount
signal checkHover
signal addItem
signal pot_full
signal sendAmount
signal heldItem
signal held

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	print(process_mode)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("esc"):
		$ColorRect.show()
		toggle_pause()
		
func toggle_pause():
	print('paused')
	get_tree().paused = !get_tree().paused
	





#shelf Func
func updateAmount():
	index += 1
	emit_signal('update_amount',index)

func mouseEnterPot():
	hover = true
	check_Hover()

func mouseExitPot():
	hover = false
	check_Hover()

func check_Hover():
	emit_signal('checkHover',hover)
	
func sendName(nametxt):
	emit_signal('addItem',nametxt)
func potFull():
	print('full')
	emit_signal('pot_full')
func send_Amount(nameAmount):
	emit_signal('sendAmount', nameAmount)
func checkHeldItem(nameOf):
	print('signal: ' + nameOf)
	emit_signal('heldItem',nameOf)
func checkIfHeld(isHeld):
	emit_signal('held',isHeld)
