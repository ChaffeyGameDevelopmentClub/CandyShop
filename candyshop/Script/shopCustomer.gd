extends Sprite2D
var customerMovementState
var order
var dialogueManager
var shopScreen
# Called when the node enters the scene tree for the first time.
func _ready():
	customerMovementState = 1
	order = get_tree().current_scene.get_node("OrderRect")
	dialogueManager = get_tree().current_scene.get_node("DialogueManager")
	shopScreen = get_tree().current_scene#.get_node("ShopScreen")


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
func completeOrder():
	customerMovementState = 2
	order._hideOrder()
func newCustomer():
	set_texture(preload("res://Assets/icon.svg"))
	customerMovementState = 1
	print("yummers")
