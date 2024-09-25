extends Control

@export var node : Control
@export var textureRect : TextureRect
@export var array1 : ShelfResource
@export var array2: ShelfResource

var held
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('heldItem',changeTexture)
	GameManager.connect('held', checkHeld)

func checkHeld(isHeld):
	held = isHeld

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	node.position = get_global_mouse_position()
	if held == true:
		textureRect.show()
	elif held == false:
		textureRect.hide()

func changeTexture(nameOf):
	print(nameOf)
	var img = checkArray1(nameOf)
	textureRect.texture = img


func checkArray1(name):
	var size = array1.item_array.size()
	for i in size:
		if array1.item_array[i]:
			return array1.item_array[i].img
