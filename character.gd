class_name Character

extends Node

enum Type { ALLY, ENEMY }

signal died()

@export var health : int
@export var damage : int

func attack(who : Character, attacking : Character):
	# attacks a given character
	who.health -= attacking.damage
	
func defend():
	pass
	
func die():
	health = 0
	died.emit()
