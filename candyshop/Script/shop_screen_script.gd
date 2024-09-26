extends Node2D
var itemOrdered
var rng = RandomNumberGenerator.new()
#var items1 = ["Chocolate Popcorn", "Chocolate Bears", "Bear Pop", "Gummy-Pops", "Gummy Sharks", "Chocolate Forest", "Gingerbread House", "Gummy Army", "Strawberry Fields", "Chocolate Latte", "Gummy Candy Corn", "Swedish Fish", "Caramel Apples", "Ginger Bread Man", "last"]
var items2 = []

@export var day: String
@export var dayCounter: Label

@export var NextLevel:StringName

@export var moneyNeed: int
var money = 0
var sellAmount = 0

@export var need1: int
@export var need2: int
@export var need3: int
@export var need4: int
@export var need5: int

var have1 = 0
var have2 = 0
var have3 = 0 
var have4 = 0
var have5 = 0

@export var totalOrders:int
var orders = 0

@export var Customer : Sprite2D
@export var DialogueManager : Control
@export var orderItem1 : Sprite2D
@export var timeLimit : Timer

@export var resourceArray : ShelfResource
var items1 = []

func endDay():
	if money >= moneyNeed:
		print("won")
		get_tree().change_scene_to_file(NextLevel)
		#show next day 
		#win
	else:
		get_tree().change_scene_to_file("res://Scenes/DaySystem/Levels/lose.tscn")
		
	pass
	
	


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("hello")
	GameManager.connect('sendOut',sendTo)
	for i in resourceArray.item_array.size():
		items1.append(resourceArray.item_array[i].Name)
	#print(items1)
	#print(resourceArray.item_array[0].Amount)
func makeOrder():
	itemOrdered = items1[rng.randf_range(0,4)]
	#print("ordered: " + itemOrdered)
	setItem1()
	#print_debug(itemOrdered)
	return itemOrdered
	
	print("hello")
	dayCounter.text = "day: " + str(day) + " money: " + str(money) + " money needed:" + str(moneyNeed)
	GameManager.connect('sendOut',sendTo)
	for i in resourceArray.item_array.size():
		items1.append(resourceArray.item_array[i].Name)
	print(items1)
	print(resourceArray.item_array[0].Amount)
func _makeOrder():
	if have1 != need1:
		itemOrdered = items1[rng.randf_range(0,4)]
		have1 +=1
		sellAmount = 10
		orders += 1
		print("ordered: " + itemOrdered)
		setItem1()
	elif have2 != need2:
		itemOrdered = items1[randi_range(5,8)]
		have2 +=1
		sellAmount = 15
		orders += 1
		print("ordered: " + itemOrdered)
		setItem1()
	elif have3 != need3:
		itemOrdered = items1[randi_range(9,11)]
		have3 +=1
		sellAmount = 20
		orders += 1
		print("ordered: " + itemOrdered)
		setItem1()
	elif have4 != need4:
		itemOrdered = items1[randi_range(12,13)]
		have4 +=1
		sellAmount = 25
		orders += 1
		print("ordered: " + itemOrdered)
		setItem1()
	elif have5 != need5:
		itemOrdered = items1[randi_range(14,14)]
		have5 +=1
		sellAmount = 1000
		orders += 1
		print("ordered: " + itemOrdered)
		setItem1()
	elif orders == totalOrders:
		endDay()
	else:
		
		print("oof")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_serve_button_pressed():
	#items2.append(itemOrdered)
	timeLimit.stop()
	if items2.has(itemOrdered):
		print("Order Complete")
		money += sellAmount
		print(money)
		dayCounter.text = "day: " + str(day) + "money: " + str(money) + " money needed:" + str(moneyNeed)
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
		orderItem1.set_texture(resourceArray.item_array[1].image)
	elif(itemOrdered == "Candy Corn"):
		orderItem1.set_texture(resourceArray.item_array[1].image)
	elif(itemOrdered == "Chocolate Bears"):
		orderItem1.set_texture(resourceArray.item_array[0].image)
	elif(itemOrdered == "Gummy Bear Army"):
		orderItem1.set_texture(resourceArray.item_array[7].image)
	elif(itemOrdered == "Gummy Sharks"):
		orderItem1.set_texture(resourceArray.item_array[4].image)
	elif(itemOrdered == "Gummy Worm Pops"):
		orderItem1.set_texture(resourceArray.item_array[3].image)
	else:
		orderItem1.set_texture(preload("res://Assets/icon.svg"))
	orderItem1.scale = Vector2(100, 100) / orderItem1.texture.get_size()

func sendTo(nameOf):
	#print("sendto: " + nameOf)
	items2.append(nameOf)
