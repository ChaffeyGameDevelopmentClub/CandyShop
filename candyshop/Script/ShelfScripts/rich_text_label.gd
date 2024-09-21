extends RichTextLabel
#var shelf_crate = "res://Script/ShelfScripts/shelf_crate.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('addItem',changeText)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeText(nameText):
	self.text = nameText
