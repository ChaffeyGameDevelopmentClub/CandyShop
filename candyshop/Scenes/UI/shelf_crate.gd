extends TextureButton
@export var itemName : RichTextLabel
@export var img : TextureRect
@export var itemAmount : RichTextLabel

var amount
var held : bool
var hover : bool
signal addItem

func initName(tempname):
	#Name
	name = tempname
	var nameFin = '[center]' + name + '[/center]'
	itemName.text = nameFin
	
	
func initAmount(tempAmount):
	#Amount
	amount = tempAmount
	var amounttxt = '[center]' + str(tempAmount) + '[/center]'
	itemAmount.text = amounttxt
	
func initImg(Img):
	#Img
	Img = img.texture
	


func _on_button_down() -> void:
	held = true
	print(name + ' Down')
	if amount == 0:
		pass
	else:
		amount -= 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	print(amount)

func _on_button_up() -> void:
	held = false
	print(name + ' Up')
	if amount == 0:
		pass
	elif hover:
		amount -= 1
		emit_signal('addItem',name)
	else:
		amount += 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	print(amount)
	
func _ready() -> void:
	GameManager.connect('checkHover', check_Hover)
func check_Hover(hover):
	if hover == true:
		print('true')
	if hover == false:
		print('false')
