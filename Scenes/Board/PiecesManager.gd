extends Node2D

var Piece = load("res://Scenes/Pieces/Piece.tscn")
var Striker = load("res://Scenes/Pieces/Striker.tscn")

const DISKS_COLORS = [
	Color8(163, 114, 72),
	Color8(61, 61, 61),
	Color8(112, 7, 7)
]

const PIECE_D : float = 30.0
const MIN_DISK_SPEED : float = 0.05

var in_prepare_mode = true
var snapping_lines : Array

func _ready():
	snapping_lines = get_tree().get_nodes_in_group("snapping_lines")

func new_game() -> void:
	remove_all_children()
	call_deferred("register_new_pieces")
	
func remove_all_children() -> void:
	for piece in get_children():
		piece.queue_free()
	
func register_new_pieces() -> void:
	var SQRT_3 = 1.732
	
	create_piece(Vector2.ZERO, DISKS_COLORS[2])
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
		
		create_piece(Vector2(x, y), DISKS_COLORS[i%2])
		
		angle += PI_OVER_3
		
func create_piece(piece_position:Vector2, piece_modulate:Color):
	var piece = Piece.instance()
	add_child(piece)
	piece.modulate = piece_modulate
	piece.set_pieces_manager(self)
	piece.position = piece_position
		
func _process(delta):
	if in_prepare_mode:
		return
		
	for piece in get_children():
		if piece.linear_velocity.length() > MIN_DISK_SPEED:
			return
			
	enter_prepare_mode()
		
func make_everything_rigid() -> void:
	for piece in get_children():
		piece.make_rigid()
		
	yield(get_tree().create_timer(0.1), "timeout")
	in_prepare_mode = false
	
func enter_prepare_mode() -> void:
	for piece in get_children():
		piece.enter_prepare_mode()
	
	in_prepare_mode = true

func disk_reached(piece) -> void:
	#call_deferred("remove_child", piece)
	pass