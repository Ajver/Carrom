extends Node

onready var board = get_parent()
onready var game : Node
onready var pieces_manager : Node
onready var players : Dictionary

var current_player_color : String = "white"

var was_current_player_piece_reached : bool

var was_queen_just_reached : bool
var was_queen_reached_before : bool
var was_queen_covered : bool

func new_game():
	reset("white")
	
func reset(player_color:String) -> void:
	game = board.game
	pieces_manager = board.find_node("PiecesManager")
	players = {
		"white": game.find_node("Player1"),
		"black": game.find_node("Player2")
	}
	set_current_player(player_color)
	reset_all_variables()

func set_current_player(player_color:String) -> void:
	current_player_color = player_color
	
func reset_all_variables() -> void:
	was_current_player_piece_reached = false
	was_queen_just_reached = false
	was_queen_reached_before = false
	was_queen_covered = false

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
	
	