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

func _input(event) -> void:
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
	
func _on_Mouse_entered() -> void:
	is_mouse_in = true
	
	if striker.is_holded:
		snap_striker()

func snap_striker() -> void:
		is_snapping = true
		striker.is_snapped_to_line = true

func _on_Mouse_exited() -> void:
	is_mouse_in = false
	
	if striker.is_holded:
		unsnap_striker()

func unsnap_striker() -> void:
		is_snapping = false
		striker.is_snapped_to_line = false

func set_striker(st) -> void:
	striker = st
	striker.connect("grabbed", self, "_on_Striker_grabbed")
	
func _on_Striker_grabbed() -> void:
	if is_mouse_in:
		snap_striker()
		
