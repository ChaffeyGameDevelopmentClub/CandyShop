extends Control

@export var node : Control
@export var textureRect : TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('heldItem',changeTexture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	node.position = get_global_mouse_position()

func changeTexture(nameOf):
	print(nameOf)
