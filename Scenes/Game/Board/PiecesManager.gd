extends Node2D

signal piece_reached(piece)

onready var board = get_parent()
onready var game : Node
onready var rules : Node

var Piece = load("res://Scenes/Pieces/Piece.tscn")
var Striker = load("res://Scenes/Pieces/Striker.tscn")

const PIECES_TYPES = {
	0: [ "white", Color8(255, 240, 230) ],
	1: [ "black", Color8(61, 61, 61) ],
	2: [ "queen", Color8(112, 7, 7) ]
}

const PIECE_D : float = 20.0
const MIN_DISK_SPEED : float = 0.01

var in_prepare_mode = true
var snapping_lines : Array

func _ready():
	snapping_lines = get_tree().get_nodes_in_group("snapping_lines")

func new_game() -> void:
	game = board.game
	rules = game.find_node("Rules")
	
	if not is_connected("piece_reached", rules, "_on_Piece_reached"):
		connect("piece_reached", rules, "_on_Piece_reached")
		
	remove_all_children()
	call_deferred("register_new_pieces")
	
func remove_all_children() -> void:
	for piece in get_children():
		piece.queue_free()
	
func register_new_pieces() -> void:
	var SQRT_3 = 1.732
	
	create_piece(Vector2.ZERO, PIECES_TYPES[2])
	create_6_pieces(PIECE_D, 0.0)
	create_6_pieces(PIECE_D*2, 0.0)
	create_6_pieces(PIECE_D * SQRT_3, PI / 6.0)
	
	var striker = Striker.instance()
	add_child(striker)
	striker.position = Vector2(0, PIECE_D * 5)
	
	for line in snapping_lines:
		line.set_striker(striker)
	
func create_6_pieces(R:float, angle:float):
	var PI_OVER_3 = PI / 3.0
	
	for i in range(6):
		var x = sin(angle) * R
		var y = cos(angle) * R
		
		create_piece(Vector2(x, y), PIECES_TYPES[i%2])
		
		angle += PI_OVER_3
		
func create_piece(piece_position:Vector2, piece_type:Array):
	var piece = Piece.instance()
	call_deferred("add_child", piece)
	piece.position = piece_position
	piece.piece_type = piece_type[0]
	piece.modulate = piece_type[1]
	piece.set_pieces_manager(self)
		
func _process(delta):
	if in_prepare_mode:
		return
		
	for piece in get_children():
		if !piece.sleeping and piece.linear_velocity.length_squared() > MIN_DISK_SPEED:
			print(piece.linear_velocity.length_squared())
			return
			
	enter_prepare_mode()
		
func make_everything_rigid() -> void:
	for piece in get_children():
		piece.make_rigid()
		
	for line in snapping_lines:
		line.is_snapping = false
		
	yield(get_tree().create_timer(0.1), "timeout")
	in_prepare_mode = false
	
func enter_prepare_mode() -> void:
	for piece in get_children():
		piece.enter_prepare_mode()
	
	in_prepare_mode = true
	
	rules.next_turn()

func piece_reached(piece) -> void:
	emit_signal("piece_reached", piece)
	
func restore_queen() -> void:
	create_piece(Vector2.ZERO, PIECES_TYPES[2])