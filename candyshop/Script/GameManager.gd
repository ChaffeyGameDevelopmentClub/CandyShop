extends Node

var index
var amount
signal update_amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func updateAmount():
	emit_signal('update_amount',index,amount)
