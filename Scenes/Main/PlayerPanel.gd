extends MarginContainer

export(String) var piece_type

onready var score_label = find_node("Score")
onready var piece_texture = find_node("PieceTexture")

var score : int = 0

func _ready():
	set_score(0)
	
	match piece_type:
		"white":
			piece_texture.modulate = Color8(163, 114, 72)
		"black":
			piece_texture.modulate = Color8(61, 61, 61)
			
func set_score(value:int):
	score = value
	score_label.text = "Score: " + str(score)
	
func add_score(value:int = 1):
	set_score(score + value)