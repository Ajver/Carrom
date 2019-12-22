extends TextureButton

export(String) var language

func _ready() -> void:
	connect("pressed", self, "_change_language")
	
func _change_language() -> void:
	if T.current_language != language:
		T.set_language(language)