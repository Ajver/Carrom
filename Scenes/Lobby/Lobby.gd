extends Control

signal create_game_btn_pressed

onready var main = get_node("/root/Main")

func _on_JoinGameBtn_pressed() -> void:
	var game_ip = get_game_ip()
	
	# TODO

func get_game_ip() -> String:
	var game_ip_text_enter = find_node("GameIP")
	return game_ip_text_enter.text

func _on_CreateGameBtn_pressed() -> void:
	Network.create_server(get_player_name())
	emit_signal("create_game_btn_pressed")
	
func get_player_name() -> String:
	var player_name_text_enter = find_node("NameEnter")
	return player_name_text_enter.text

func _on_EN_Flag_pressed():
	T.set_language("en")

func _on_PL_Flag_pressed():
	T.set_language("pl")
