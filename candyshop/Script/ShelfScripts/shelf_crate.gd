extends TextureButton
@export var itemName : RichTextLabel
@export var texturerect : TextureRect
@export var itemAmount : RichTextLabel

var amount
var held : bool
var isHover : bool
var full : bool

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
	print(Img)
	texturerect.texture = Img
	pass
	


func _on_button_down() -> void:
	held = true
	GameManager.checkIfHeld(held)
	#print(name + ' Down')
	GameManager.checkHeldItem(name)
	print('held ' + name)
	if amount == 0:
		pass
	else:
		amount -= 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	#print(amount)

func _on_button_up() -> void:
	held = false
	GameManager.checkIfHeld(held)
	#print(name + ' Up')
	#print(isHover)
	if amount == 0:
		pass
	elif isHover and !full:
		#adds item to pot
		GameManager.sendName(name)
	else:
		amount += 1
	itemAmount.text = '[center]' + str(amount) + '[/center]'
	#print(amount)
	
func _ready() -> void:
	GameManager.connect('checkHover', check_Hover)
	GameManager.connect("pot_full", check_full)
	GameManager.connect("sendAmount", addTo)
	
func check_Hover(hover):
	if hover == true:
		isHover = true
		#print(isHover)
	if hover == false:
		isHover = false
		#print(isHover)

func check_full():
	full = true
	
func addTo(nameOf):
	#print(nameOf)
	#print(name)
	if nameOf == name:
		amount += 1
		print(amount)
	itemAmount.text = '[center]' + str(amount) + '[/center]'
