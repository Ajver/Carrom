extends Node2D

onready var disk_manager = $DisksManager

func _ready() -> void:
	new_game()

func new_game() -> void:
	disk_manager.new_game()

func _input(event) -> void:
	if Input.is_key_pressed(KEY_S):
		new_game()
		
func make_everything_rigid() -> void:
	disk_manager.make_everything_rigid()