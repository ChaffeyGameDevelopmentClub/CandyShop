extends GridContainer

var holdingCorn : bool
@export var shelfResource : ShelfResource

var button_preload = preload('res://Scenes/shelf_button.tscn')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('update_amount',example)
	
	for i in 2:
		var newbutton = button_preload.instantiate()
		newbutton.init(shelfResource.item_array[i].Name)
		add_child(newbutton)
	#GameManager.updateAmount(i,10)
func example(index,amount):
	pass
