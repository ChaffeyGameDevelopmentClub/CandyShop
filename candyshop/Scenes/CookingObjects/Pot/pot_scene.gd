extends Node2D




func _proccess(delta):
	$GrowTimer.start()
	

func _on_grow_timer_timeout() -> void:
	print("done")
	$PotSprite.queue_free()
	
