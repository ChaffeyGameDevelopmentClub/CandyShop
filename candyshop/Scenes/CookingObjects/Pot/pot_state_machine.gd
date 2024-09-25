extends Node

class_name PotStateMachine
@export var pot:Node2D
#@export var sprout:Sprite2D



@export var current_state : State

var states : Array[State]


func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
		else:
			push_warning("Child " + child.name + "is not a State for PotStateMachine")


func _physics_process(delta):
	if (current_state.next_state !=null):
		switch_states(current_state.next_state)
	


func switch_states(new_state : State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()
