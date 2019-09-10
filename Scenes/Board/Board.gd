extends Node2D

onready var pieces_manager = $PiecesManager
onready var rules = $Rules

func _ready() -> void:
	new_game()

func new_game() -> void:
	pieces_manager.new_game()
	rules.new_game()
	
func _input(event) -> void:
	if Input.is_key_pressed(KEY_S):
		pieces_manager.enter_prepare_mode()
		new_game()
		
func make_everything_rigid() -> void:
	pieces_manager.make_everything_rigid()