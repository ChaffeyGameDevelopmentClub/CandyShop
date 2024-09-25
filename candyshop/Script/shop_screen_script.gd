extends Node2D
var itemOrdered
var rng = RandomNumberGenerator.new()
var items1 = ["Chocolate Popcorn", "Chocolate Bears", "Bear Pop", "Gummy-Pops", "Gummy Sharks", "Chocolate Forest", "Gingerbread House", "Gummy Army", "Strawberry Fields", "Chocolate Latte", "Gummy Candy Corn", "Swedish Fish", "Caramel Apples", "Ginger Bread Man", "last"]
# Called when the node enters the scene tree for the first time.
func _ready():
	_makeOrder()

func _makeOrder():
	itemOrdered = items1[rng.randf_range(0,14)]
	print(itemOrdered)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
