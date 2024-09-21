extends Node

var index = 1
var amount
var hover
signal update_amount
signal checkHover
signal addItem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
