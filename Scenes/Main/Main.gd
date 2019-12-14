extends Node

onready var lobby = find_node("Lobby")

var Game = preload("res://Scenes/Game/Game.tscn")

func _ready() -> void:
	T._load_language_file("en")
	
	var labels = get_tree().get_nodes_in_group("LanguageLabel")
	for label in labels:
		label.update_text()

func _input(event) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
func start_game() -> void:
	var game = Game.instance()
	call_deferred("add_child", game)
	lobby.hide()