extends Control
#var shelf_crate = "res://Script/ShelfScripts/shelf_crate.gd"
@export var ing1Label : RichTextLabel
@export var ing2Label : RichTextLabel
@export var ing3Label : RichTextLabel
@export var ing4Label : RichTextLabel

var ingNum = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('addItem',changeText)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeText(nameText):
	print('Ing Num:' + str(ingNum))
	if ingNum == 1:
		ing1Label.text = nameText
	if ingNum == 2:
		ing2Label.text = nameText
	if ingNum == 3:
		ing3Label.text = nameText
	if ingNum == 4:
		ing4Label.text = nameText
	ingNum += 1
	
