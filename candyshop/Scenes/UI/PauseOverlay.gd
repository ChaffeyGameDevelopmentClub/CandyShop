extends Control


@export var anime: AnimationPlayer

func _ready() -> void:
	#anime.play("RESET")
	pass

func resume():
	get_tree().paused = false
	anime.play_backwards("Blur")

func pause():
	get_tree().paused = true
	anime.play("Blur")



func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()



func _on_resume_pressed() -> void:
	resume()

func _process(delta: float) -> void:
	testEsc()
