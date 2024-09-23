extends Node

class_name PotStateMachine

@export var current_state : State

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
		
		
		else:
		
		
			push_warning("Child " + child.name + "is not a State for PotStateMachine")
			

func check_shown():
	return current_state.Show_Sprout
	return current_state.Show_Grown

func switch_states(new_state : State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()
