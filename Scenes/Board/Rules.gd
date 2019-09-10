extends Node

onready var main = get_node("/root/Main")
onready var pieces_manager = main.find_node("PiecesManager")
onready var players : Dictionary = {
	"white": main.find_node("Player1"),
	"black": main.find_node("Player2")
}

var current_player_color : String = "white"

var was_current_player_piece_reached : bool

var was_queen_just_reached : bool
var was_queen_reached_before : bool
var was_queen_covered : bool

func new_game():
	reset("white")

func _on_Piece_reached(piece) -> void:
	if piece.piece_type == current_player_color:
		was_current_player_piece_reached = true
		
	if was_queen_reached_before:
		was_queen_reached_before = false
		
		if piece.piece_type == current_player_color:
			get_current_player().add_score(2)
			was_queen_covered = true
		else:
			pieces_manager.restore_queen()
			
	elif piece.piece_type == "queen":
		was_queen_just_reached = true
		get_current_player().add_score(3)
	else:
		players[piece.piece_type].add_score()
		
func get_current_player() -> Node:
	return players[current_player_color]
	
func next_turn() -> void:
	if not was_current_player_piece_reached:
		if not was_queen_just_reached:
			if was_queen_reached_before:
				was_queen_reached_before = false
				pieces_manager.restore_queen()
				
			switch_current_player_color()
		
	was_current_player_piece_reached = false
	
	if was_queen_just_reached:
		was_queen_just_reached = false
		was_queen_reached_before = true
	
func switch_current_player_color() -> void:
	get_current_player().unset_current()
	
	match current_player_color:
		"white":
			current_player_color = "black"
		"black":
			current_player_color = "white"
			
	get_current_player().set_current()
	
func reset(player_color:String) -> void:
	set_current_player(player_color)
	
func set_current_player(player_color:String) -> void:
	current_player_color = player_color
	get_current_player().set_current()

func reset_all_variables() -> void:
	was_current_player_piece_reached = false
	was_queen_just_reached = false
	was_queen_reached_before = false
	was_queen_covered = false
	