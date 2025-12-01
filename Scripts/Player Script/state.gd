'''The State class here defines a template for individual states that 
can be used by the StateMachine.'''


class_name State
extends Node
signal Transitioned

func enter() -> void:
	pass
	
func exit() -> void:
	pass

func Update(delta: float) -> State:
	return null
	
func Input_Update(event : InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	return null
