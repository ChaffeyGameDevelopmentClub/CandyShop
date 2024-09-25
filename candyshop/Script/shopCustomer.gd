extends Sprite2D
var customerMovementState
@export var order : ColorRect
@export var dialogueManager : Control
@export var shopScreen : Node2D
var ordersCompleted : int
var totalOrders : int
var ordersFailed : int
@export var timeLimit : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	ordersCompleted = 0
	ordersFailed = 0
	totalOrders = 0
	customerMovementState = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.x<1500 and customerMovementState == 1):
		position += Vector2(10, 0)
	if(position.x>1499 and customerMovementState == 1):
		customerMovementState = 0
		shopScreen._makeOrder()
		dialogueManager.orderStart()
	if(position.x>-200 and customerMovementState == 2):
		position -= Vector2(10, 0)
	if(position.x<-199 and customerMovementState == 2):
		customerMovementState = 0
		newCustomer()
	
func dialogueEnd():
	order._summonOrder()
	timeLimit.start()
func completeOrder():
	customerMovementState = 2
	order._hideOrder()
	ordersCompleted+=1
	totalOrders+=1
	#print("customers: " + str(ordersCompleted))
func failedOrder():
	customerMovementState = 2
	order._hideOrder()
	ordersFailed+=1
	totalOrders+=1
	#print("customers: " + str(ordersCompleted))
func newCustomer():
	set_texture(preload("res://Assets/icon.svg"))
	customerMovementState = 1
	#print("yummers")
