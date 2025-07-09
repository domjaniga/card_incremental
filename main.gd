# numbers on the cards give damage
# types of cards give perks e.g. magic staff might have a damage mult, a sword might have something to do with block strength
# items could influence the permanent player stats

extends Node

@export var player : Character
@export var enemy : Character

#@onready var player_health_label: Label = $CanvasLayer/Player_health
#@onready var enemy_health_label: Label = $CanvasLayer/Enemy_health

@onready var player_health_label: Label = %Player_health
@onready var enemy_health_label: Label = %Enemy_health


func _ready():
	# Set labels to show starting health
	player_health_label.text = str(player.health)
	enemy_health_label.text = str(enemy.health)
	
	#StaticData.import_json("res://data/card_data.json")
	#print(StaticData.card_database["1"]["card_attack"])
	#print(StaticData.card_database)
	#print(static_data.card_databse["c1"])
	
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
	# Change to win_screen
	get_tree().change_scene_to_file("res://win_screen.tscn")
	enemy_health_label.text = str("DEAD!")
	$Timer.stop()


func _on_player_died() -> void:
	# Change to loss_screen
	get_tree().change_scene_to_file("res://loss_screen.tscn")
	player_health_label.text = str("DIED!")
	$Timer.stop()
