extends Node

var LANGUAGES_DIRECTORY = "res://Languages/"
var _texts : Dictionary = {}
var current_language : String setget set_language

func _ready() -> void:
	set_language("en")

func set_language(language:String) -> void:
	current_language = language
	_load_language_file(language)
	
	var labels = get_tree().get_nodes_in_group("LanguageLabel")
	for label in labels:
		label.update_text()

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