extends Node

var LANGUAGES_DIRECTORY = "res://Languages/"
var _texts : Dictionary = {}

func get(text_id:String) -> String:
	if _texts.has(text_id):
		return _texts[text_id]
	else:
		return "Wrong text id: '" + text_id + "'"
		
func _load_language_file(language:String) -> void:
	var file = File.new()
	file.open(LANGUAGES_DIRECTORY + language + ".json", File.READ)
	var file_content : String = file.get_as_text()
	_texts = parse_json(file_content)