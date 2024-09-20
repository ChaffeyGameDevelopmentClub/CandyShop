extends TextureButton
@export var itemName : RichTextLabel
@export var img : TextureRect
@export var itemAmount : RichTextLabel


func initName(tempname):
	#Name
	name = tempname
	var nameFin = '[center]' + name + '[/center]'
	itemName.text = nameFin
	
	#Img
func initAmount(tempAmount):
	#Amount
	var amount = '[center]' + str(tempAmount) + '[/center]'
	itemAmount.text = amount
	
	

func _on_button_down() -> void:
	print(name + ' Down')


func _on_button_up() -> void:
	print(name + ' Up')
