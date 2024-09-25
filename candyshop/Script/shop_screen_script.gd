extends Node2D
var itemOrdered
var rng = RandomNumberGenerator.new()
#var items1 = ["Chocolate Popcorn", "Chocolate Bears", "Bear Pop", "Gummy-Pops", "Gummy Sharks", "Chocolate Forest", "Gingerbread House", "Gummy Army", "Strawberry Fields", "Chocolate Latte", "Gummy Candy Corn", "Swedish Fish", "Caramel Apples", "Ginger Bread Man", "last"]
var items2 = []

@export var Customer : Sprite2D
@export var DialogueManager : Control
@export var orderItem1 : Sprite2D
@export var timeLimit : Timer

@export var resourceArray : ShelfResource
var items1 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("hello")
	GameManager.connect('sendOut',sendTo)
	for i in resourceArray.item_array.size():
		items1.append(resourceArray.item_array[i].Name)
	#print(items1)
	#print(resourceArray.item_array[0].Amount)
func _makeOrder():
	itemOrdered = items1[rng.randf_range(0,4)]
	#print("ordered: " + itemOrdered)
	setItem1()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_serve_button_pressed():
	#items2.append(itemOrdered)
	timeLimit.stop()
	if items2.has(itemOrdered):
		#print("Order Complete")
		Customer.completeOrder()
		DialogueManager.completeOrder()
	else:
		#print("Order Failed")
		Customer.failedOrder()
		DialogueManager.failedOrder()


func _on_time_limit_timer_timeout():
	#print("Order Failed")
	Customer.failedOrder()
	DialogueManager.failedOrder()

func setItem1():
	orderItem1.visible = true
	if(itemOrdered == "Bear Pop"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/bear pop.png"))
	elif(itemOrdered == "Candy Corn"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/candy corn.png"))
	elif(itemOrdered == "Chocolate Bears"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/chocolate bears.png"))
	elif(itemOrdered == "Gummy Bear Army"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/Gummy bear army.png"))
	elif(itemOrdered == "Gummy Sharks"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/gummy sharks.png"))
	elif(itemOrdered == "Gummy Worm Pops"):
		orderItem1.set_texture(preload("res://Assets/Ingredent Assets/gummy worm pops.png"))
	else:
		orderItem1.set_texture(preload("res://Assets/icon.svg"))
	orderItem1.scale = Vector2(100, 100) / orderItem1.texture.get_size()

func sendTo(nameOf):
	#print("sendto: " + nameOf)
	items2.append(nameOf)
