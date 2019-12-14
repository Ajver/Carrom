extends TabContainer

func _ready() -> void:
	add_to_group("LanguageLabel")
	
func update_text() -> void:
	var text_ids := [
		"lobby.createGame",
		"lobby.joinGame",
	]
	
	for i in get_child_count():
		var tab = get_child(i)
		tab.name = T.get(text_ids[i])