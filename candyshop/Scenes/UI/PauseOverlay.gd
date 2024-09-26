extends Control

@export var pls: CanvasLayer
@export var anime: AnimationPlayer

func _ready() -> void:
	pls.visible = false
	anime.play("RESET")
	pass

func resume():
	get_tree().paused = false
	$PanelContainer/VBoxContainer.visible = false
	anime.play_backwards("Blur")
	pls.visible = false

func pause():
	pls.visible = true
	get_tree().paused = true
	$PanelContainer/VBoxContainer.visible = true
	anime.play("Blur")



func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()



func _on_resume_pressed() -> void:
	resume()

func _process(delta):
	testEsc()


func _on_quit_pressed() -> void:
	pass # Replace with function body.
