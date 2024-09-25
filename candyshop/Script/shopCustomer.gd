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
		customerMovementState = 2
		shopScreen._makeOrder()
		dialogueManager.orderStart()
	
func dialogueEnd():
	order._summonOrder()
