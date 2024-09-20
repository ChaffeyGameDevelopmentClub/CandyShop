extends TextureButton
@export var itemName : RichTextLabel
@export var img : TextureRect
@export var itemAmount : RichTextLabel
var amount

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
	print(name + ' Down')
	amount -= 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	print(amount)

func _on_button_up() -> void:
	print(name + ' Up')
	if 1==0:
		pass
	else:
		amount += 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	print(amount)
