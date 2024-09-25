extends Node2D
var itemOrdered
var rng = RandomNumberGenerator.new()
var items1 = ["Chocolate Popcorn", "Chocolate Bears", "Bear Pop", "Gummy-Pops", "Gummy Sharks", "Chocolate Forest", "Gingerbread House", "Gummy Army", "Strawberry Fields", "Chocolate Latte", "Gummy Candy Corn", "Swedish Fish", "Caramel Apples", "Ginger Bread Man", "last"]
var items2 = []
var Customer
var DialogueManager
# Called when the node enters the scene tree for the first time.
func _ready():
	Customer = get_tree().current_scene.get_node("ShopScreen").get_node("Customer")
	DialogueManager = get_tree().current_scene.get_node("ShopScreen").get_node("DialogueManager")

func _makeOrder():
	itemOrdered = items1[rng.randf_range(0,14)]
	print("ordered: " + itemOrdered)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_serve_button_pressed():
	items2.append(itemOrdered)
	if items2.has(itemOrdered):
		print("Order Complete")
		Customer.completeOrder()
		DialogueManager.completeOrder()
	else:
		print("Order Failed")
