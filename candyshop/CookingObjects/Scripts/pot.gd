extends Node2D
@onready var progress_bar = $ProgressBar1
@onready var grow_timer = $GrowTimer

func _ready():
	grow_timer.wait_time = progress_bar.value

func _proccess(delta):
	#$GrowTimer.start()
	print(grow_timer.time_left)
	progress_bar.value = grow_timer.time_left

func _on_grow_timer_timeout() -> void:
	print("done")
	$PotSprite.queue_free()
	
