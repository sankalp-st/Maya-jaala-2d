extends Node

@export var initial_state : State
var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state
	print("Available states:", states.keys())

	 
func _process(delta):
	if current_state:
		current_state.Update(delta)
	
	
	
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
		
		
		
func _input(event):
	if current_state:
		current_state.Input_Update(event)
		

func on_child_transition(state,new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("State not found :",new_state_name)
		return
		
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
	#print(current_state)
	
