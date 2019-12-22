extends Node

onready var lobby = find_node("Lobby")

var Game = preload("res://Scenes/Game/Game.tscn")

func _ready() -> void:
	T.set_language("en")
	lobby.connect("create_game_btn_pressed", self, "_start_game")

func _input(event) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
func _start_game() -> void:
	var game = Game.instance()
	call_deferred("add_child", game)
	game.connect("tree_entered", self, "_on_Game_tree_entered")
	lobby.hide()
	
func _on_Game_tree_entered() -> void:
	print("Game entered Tree!")