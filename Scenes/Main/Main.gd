extends Control

func _input(event) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
