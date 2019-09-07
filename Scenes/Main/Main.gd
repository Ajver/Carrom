extends Control

onready var player1 = find_node("Player1")
onready var player2 = find_node("Player2")

func _input(event) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func piece_reached(piece) -> void:
	match piece.piece_type:
		"white":
			player1.add_score()
		"black":
			player2.add_score()