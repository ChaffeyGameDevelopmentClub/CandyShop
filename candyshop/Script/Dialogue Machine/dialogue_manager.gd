extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	orderStart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func orderStart():
	#how many npcs we have in Dialogue Array
	var npc = randi_range(0,0)
	print(npc)
	
	
