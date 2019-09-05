extends Node2D

onready var disk_manager = $DisksManager

func _ready():
	new_game()

func new_game():
	disk_manager.new_game()

func _input(event):
	if Input.is_key_pressed(KEY_S):
		new_game()