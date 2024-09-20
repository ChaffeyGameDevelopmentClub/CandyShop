extends TextureButton

@export var itemName : RichTextLabel



func init(tempname):
	name = tempname
	var nameFin = '[center]' + name + '[/center]'
	itemName.text = nameFin

func _on_button_down() -> void:
	print(name)


func _on_button_up() -> void:
	print(name)
