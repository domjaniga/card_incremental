# numbers on the cards give damage
# types of cards give perks e.g. magic staff might have a damage mult, a sword might have something to do with block strength
# items could influence the permanent player stats

extends Node

@export var player : Character
@export var enemy : Character

@onready var player_health_label: Label = $CanvasLayer/Player_health
@onready var enemy_health_label: Label = $CanvasLayer/Enemy_health


func _ready():
	# Set labels to show starting health
	player_health_label.text = str(player.health)
	enemy_health_label.text = str(enemy.health)
	
	
func _on_timer_timeout() -> void:
	# Everytime after a timer wait time
	enemy.attack(player, enemy)
	
	player_health_label.text = str(player.health)
	
	if player.health <= 0:
		player.die()

func _on_button_pressed() -> void:
	player.attack(enemy, player)
	
	enemy_health_label.text = str(enemy.health)
	
	if enemy.health <= 0:
		enemy.die()


func _on_enemy_died() -> void:
	enemy_health_label.text = str("DEAD!")
	$Timer.stop()


func _on_player_died() -> void:
	player_health_label.text = str("DIED!")
	$Timer.stop()
