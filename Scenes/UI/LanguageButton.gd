tool extends Button

export(String) var text_id
export(String) var prefix
export(String) var sufix

func set_text(new_text:String) -> void:
	set_text_with_fixes(new_text)

func set_text_with_fixes(new_text:String) -> void:
	text = prefix + new_text + sufix

func update_text() -> void:
	set_text_with_fixes(T.get(text_id))
	