extends Node2D

@onready var Sprout =get_node("Sprout")
@onready var pot_state_machine : PotStateMachine = $PotStateMachine


func SpirteShown():
	if pot_state_machine.check_if_Sprout_Shown():
		Sprout.visiblie = true
		print("should show")
	else: 
		pass
