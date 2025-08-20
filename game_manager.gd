extends Node2D

@export var turn_time_limit = 5.0
@onready var players = get_tree().get_nodes_in_group("player")

var turn_timer = 0.0
var player_turn_iter = 0

func _ready() -> void:
	players[player_turn_iter].can_move = true

func _physics_process(delta: float) -> void:
	turn_timer += delta
	if (turn_timer > turn_time_limit):
		print("Turn over")
		turn_timer = 0
		players[player_turn_iter].can_move = false
		if (player_turn_iter >= players.size()-1):
			player_turn_iter = 0
		else:
			player_turn_iter += 1
		players[player_turn_iter].can_move = true
