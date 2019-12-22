extends MarginContainer

export(String) var piece_type

onready var name_label = find_node("Name")
onready var score_label = find_node("Score")
onready var piece_texture = find_node("PieceTexture")

var score : int = 0

func _ready() -> void:
	set_score(0)
	
	match piece_type:
		"white":
			piece_texture.modulate = Color8(255, 240, 230)
		"black":
			piece_texture.modulate = Color8(61, 61, 61)
			
func set_score(value:int) -> void:
	score = value
	score_label.text = "Score: " + str(score)
	
func add_score(value:int = 1) -> void:
	set_score(score + value)
	
func set_current() -> void:
	name_label.add_color_override("font_color", Color8(255, 255, 0))
	
func unset_current() -> void:
	name_label.add_color_override("font_color", Color8(255, 255, 255))