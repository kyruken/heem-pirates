extends CharacterBody2D
 	
signal player_has_moved

@export var speed = 400
@export var player_id = '1'

var can_move = false

func get_input():
	var input_direction = Input.get_vector("move_left_" + player_id, "move_right_" + player_id, "move_up_" + player_id, "move_down_" + player_id)
	velocity = Vector2(
		Input.get_action_strength("move_right_" + player_id) - Input.get_action_strength("move_left_" + player_id),
		Input.get_action_strength("move_down_" + player_id) - Input.get_action_strength("move_up_" + player_id)
	).limit_length(1.0) * speed

	emit_signal("player_has_moved")

func _ready():
	#healthBar.init_health(Health)
	pass
	
#For physics of game mechanics
func _physics_process(delta):
	if (can_move):
		get_input()
		move_and_slide()
