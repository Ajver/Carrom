extends Control

func _on_JoinGameBtn_pressed() -> void:
	var game_ip = get_game_ip()
	
	# TODO

func get_game_ip() -> String:
	var game_ip_text_enter = find_node("GameIP")
	return game_ip_text_enter.text

func _on_CreateGameBtn_pressed() -> void:
	Network.create_server(get_player_name())
	get_tree().change_scene("res://Scenes/Game/Game.tscn")
	
func get_player_name() -> String:
	var player_name_text_enter = find_node("NameEnter")
	return player_name_text_enter.text
