extends MarginContainer

onready var score_label = find_node("Score")

var score : int = 0

func _ready():
	set_score(0)

func set_score(value:int):
	score = value
	score_label.text = "Score: " + str(score)