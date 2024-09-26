extends Control
@export var pages : CookBookArray
#1
@export var icon1 : TextureRect
@export var text1 : RichTextLabel
#2
@export var icon2 : TextureRect
@export var text2 : RichTextLabel
#3
@export var icon3 : TextureRect
@export var text3 : RichTextLabel
#4
@export var icon4 : TextureRect
@export var text4 : RichTextLabel

var page : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#1
	icon1.texture = pages.page_array[0].icon1
	text1.texture = pages.page_array[0].text1
	#2
	icon2.texture = pages.page_array[0].icon2
	text2.texture = pages.page_array[0].text2
	#3
	icon3.texture = pages.page_array[0].icon3
	text3.texture = pages.page_array[0].text3
	#4
	icon4.texture = pages.page_array[0].icon4
	text4.texture = pages.page_array[0].text4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_page_pressed() -> void:
	page += 1


func _on_prev_pahe_pressed() -> void:
	page -= 1
