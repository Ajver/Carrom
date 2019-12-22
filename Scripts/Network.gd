extends Node

const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 31400
const MAX_PLAYERS = 2

var players = {}
var self_data = {
	name = '',
	score = 0
}

func _ready() -> void:
	get_tree().connect("network_peer_disconnected", self, "_player_disconected")

func _player_disconected() -> void:
	print("Player disconected")

func create_server(player_name) -> void:
	self_data.name = player_name
	players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)