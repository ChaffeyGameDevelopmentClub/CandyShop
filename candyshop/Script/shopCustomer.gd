extends Sprite2D
var customerMovementState
var order
var dialogueManager
# Called when the node enters the scene tree for the first time.
func _ready():
	customerMovementState = 1
	order = get_tree().current_scene.get_node("OrderRect")
	dialogueManager = get_tree().current_scene.get_node("DialogueManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.x<1500 and customerMovementState == 1):
		position += Vector2(10, 0)
	if(position.x>1499 and customerMovementState == 1):
		customerMovementState = 2
		print("ShopCustomerScript")
		dialogueManager.orderStart()
	
func dialogueEnd():
	order._summonOrder()
