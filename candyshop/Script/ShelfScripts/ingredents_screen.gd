extends Control
@export var ing1Label : RichTextLabel
@export var ing2Label : RichTextLabel
@export var ing3Label : RichTextLabel
@export var ing4Label : RichTextLabel

var spot1
var spot2
var spot3
var spot4

var ingNum = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect('addItem',changeText)



func changeText(nameText):
	print('Ing Num:' + str(ingNum))
	if ingNum == 1:
		ing1Label.text = nameText
		spot1 = nameText
	if ingNum == 2:
		ing2Label.text = nameText
		spot2 = nameText
	if ingNum == 3:
		ing3Label.text = nameText
		spot3 = nameText
	if ingNum == 4:
		ing4Label.text = nameText
		spot4 = nameText
	if ingNum > 4:
		GameManager.potFull()
	ingNum += 1
	
func _on_button_pressed() -> void:
	clearpot()
	
func clearpot():
	ingNum = 1
	ing1Label.text = 'Empty'
	ing2Label.text = 'Empty'
	ing3Label.text = 'Empty'
	ing4Label.text = 'Empty'
	
	
#combineing scripts

func _on_cook_pressed() -> void:
	combine()
func addToStorage(nameOf):
	GameManager.send_Amount(nameOf)

func combine():
	#spot1
	#spot2
	#spot3
	#spot4
	var ingredents = [spot1,spot2,spot3,spot4]
	print(ingredents)
	
	#Chcolate Popcorn
	if ingredents.has('Candy Corn') and ingredents.has('Cholate'):
		addToStorage('Chcolate Popcorn')
		clearpot()
	#chocolate Bears
	if ingredents.has('Gummy Bears') and ingredents.has('Cholate'):
		addToStorage('Chocolate Bears')
		clearpot()
	#Bear Pop
	if ingredents.has('Gummy Bears') and ingredents.has('Loli-Pop'):
		addToStorage('Bear Pop')
		clearpot()
	#Gummy-Pops
	if ingredents.has('Gummy Worms') and ingredents.has('Loli-Pop'):
		addToStorage('Gummy-Pops')
		clearpot()
	#Gummy Sharks
	if ingredents.has('Gummy Bears') and ingredents.has('Gummy Worms'):
		addToStorage('Gummy Sharks')
		clearpot()
	#Lvl2
	#Chocolate Forest
	if ingredents.has('Chcolate Popcorn') and ingredents.has('Licorice') and ingredents.has('Loli-Pop'):
		addToStorage('Chocolate Forest')
		clearpot()
	#Gingerbread House
	if ingredents.has('Candy Corn') and ingredents.has('Gummy-Pops') and ingredents.has('Cholate'):
		addToStorage('Gingerbread House')
		clearpot()
	#Gummy Army
	if ingredents.has('Gummy Bears') and ingredents.has('Gummy Worms') and ingredents.has('Loli-Pop'):
		addToStorage('Gummy Army')
		clearpot()
	#Strawberry Fields
	if ingredents.has('Licorice') and ingredents.has('Gummy Worms') and ingredents.has('Loli-Pop'):
		addToStorage('Strawberry Fields')
		clearpot()
	#lvl3
	#Chocolate Latte
	if ingredents.has('Cholate') and ingredents.has('Chocolate Forest') and ingredents.has('Bear Pop'):
		addToStorage('Chocolate Latte')
		clearpot()
	#Gummy Candy Corn
	if ingredents.has('Gummy Bears') and ingredents.has('Gummy Worms') and ingredents.has('Candy Corn'):
		addToStorage('Gummy Candy Corn')
		clearpot()
	#Swedish Fish
	if ingredents.has('Strawberry Fields') and ingredents.has('Chocolate Forest') and ingredents.has('Bear Pop'):
		addToStorage('Swedish Fish')
		clearpot()
	#lvl4
	#Caramel Apples
	if ingredents.has('Chocolate Forest') and ingredents.has('Gummy Bears') and ingredents.has('Swedish Fish') and ingredents.has('Candy Corn'):
		addToStorage('Caramel Apples')
		clearpot()
	#Ginger Bread Man
	if ingredents.has('Gummy-Pops') and ingredents.has('Gummy Bears') and ingredents.has('Licorice') and ingredents.has('Gummy Candy Corn'):
		addToStorage('Ginger Bread Man')
		clearpot()
	#lvl5
	#Fun Dip
	if ingredents.has('Ginger Bread Man') and ingredents.has('Caramel Apples') and ingredents.has('Gummy Army') and ingredents.has('Gummy Sharks'):
		addToStorage('Fun Dip')
		clearpot()
