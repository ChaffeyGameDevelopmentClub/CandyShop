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
	text1.text = pages.page_array[0].text1
	#2
	icon2.texture = pages.page_array[0].icon2
	text2.text = pages.page_array[0].text2
	#3
	icon3.texture = pages.page_array[0].icon3
	text3.text = pages.page_array[0].text3
	#4
	icon4.texture = pages.page_array[0].icon4
	text4.text = pages.page_array[0].text4

var bookOn
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.position.y > 0 and bookOn:
		self.position.y -= 15
	elif self.position.y < 965 and !bookOn:
		self.position.y += 15


func _on_next_page_pressed() -> void:
	if page != 3:
		page += 1
		changePage()

func _on_prev_pahe_pressed() -> void:
	if page != 0:
		page -= 1
		changePage()

func changePage():
	icon1.texture = pages.page_array[page].icon1
	text1.text = pages.page_array[page].text1
	#2
	icon2.texture = pages.page_array[page].icon2
	text2.text = pages.page_array[page].text2
	#3
	icon3.texture = pages.page_array[page].icon3
	text3.text = pages.page_array[page].text3
	#4
	icon4.texture = pages.page_array[page].icon4
	text4.text = pages.page_array[page].text4


func _on_up_down_toggled(toggled_on: bool) -> void:
	if toggled_on:
		bookOn = true
	else:
		bookOn = false #965
