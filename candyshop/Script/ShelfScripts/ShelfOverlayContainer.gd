extends GridContainer

var holdingCorn : bool
@export var shelfResource : ShelfResource

var button_preload = preload("res://Scenes/UI/shelf_crate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('update_amount',example)
	
	for i in 1:
		var newbutton = button_preload.instantiate()
		newbutton.initName(shelfResource.item_array[i].Name)
		newbutton.initAmount(shelfResource.item_array[i].Amount)
		add_child(newbutton)
	#GameManager.updateAmount(i,10)
func example(index,amount):
	pass
