extends Area2D

enum LINE_TYPE {
	VERTICAL,
	HORIZONTAL
}

export(LINE_TYPE) var line_type = LINE_TYPE.HORIZONTAL

var is_mouse_in : bool = false
var is_snapping : bool = false

var striker = null

const LENGTH = 170

func _input(event):
	if not striker:
		return
		
	if not is_snapping:
		return
		
	if not striker.is_holded:
		return
		
	if not event is InputEventMouseMotion:
		return
		
	striker.global_position = event.position
		
	match line_type:
		LINE_TYPE.HORIZONTAL:
			striker.position.y = position.y
			striker.position.x = min(LENGTH, striker.position.x)
			striker.position.x = max(-LENGTH, striker.position.x)
		LINE_TYPE.VERTICAL:
			striker.position.x = position.x
			striker.position.y = min(LENGTH, striker.position.y)
			striker.position.y = max(-LENGTH, striker.position.y)
	
func _on_Mouse_entered():
	is_mouse_in = true
	
	if not striker:
		return
	
	print("MOUSE IN!")
	if striker.is_holded:
		is_snapping = true
		striker.is_snapped_to_line = true

func _on_Mouse_exited():
	is_mouse_in = false
	
	if not striker:
		return
	
	print("MOUSE OUT!")
	if striker.is_holded:
		is_snapping = false
		striker.is_snapped_to_line = false

func set_striker(st):
	striker = st
