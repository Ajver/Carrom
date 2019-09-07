extends RigidBody2D

var is_holded = false
var is_mouse_in = false
var on_right_area : bool = true

onready var area = $Area2D
onready var pointer = $Pointer

const MAX_POSITION : float = 280.0 

var COLORS = {
	"valid_area": Color8(255, 255, 255),
	"wrong_area": Color8(207, 19, 19)
}

func _input(event) -> void:
	if mode == MODE_RIGID:
		return
		
	if is_holded:
		if event is InputEventMouseMotion:
			global_position = event.position
			fit_into_board()
		elif Input.is_action_just_released("grab") or (event is InputEventScreenTouch and not event.is_pressed()):
			is_holded = false
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	elif is_mouse_in:
		if Input.is_action_just_pressed("grab") or (event is InputEventScreenTouch and event.is_pressed()):
			is_holded = true
			Input.set_default_cursor_shape(Input.CURSOR_MOVE)
			
func fit_into_board() -> void:
	position.x = min(MAX_POSITION, position.x)
	position.x = max(-MAX_POSITION, position.x)
	position.y = min(MAX_POSITION, position.y)
	position.y = max(-MAX_POSITION, position.y)

func _physics_process(delta) -> void:
	var areas = area.get_overlapping_areas()
	if areas.size() == 0:
		on_right_area = true
		modulate = COLORS["valid_area"]
	else:
		pointer.hide()
		on_right_area = false
	
func _on_Mouse_entered() -> void:
	is_mouse_in = true
	
	if mode == MODE_RIGID:
		return
		
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
	pointer.hide()

func _on_Mouse_exited() -> void:
	is_mouse_in = false
	
	if mode == MODE_RIGID:
		return
		
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		
	if on_right_area:
		pointer.show()

func _on_wrong_area_entered(area) -> void:
	if mode == MODE_RIGID:
		return
	
	modulate = COLORS["wrong_area"]

func _on_wrong_area_exited(area) -> void:
	if mode == MODE_RIGID:
		return
		
	if not on_right_area:
		return
		
	modulate = COLORS["valid_area"]
	
func is_on_right_area() -> bool:
	return on_right_area

func make_rigid() -> void:
	mode = MODE_RIGID
	pointer.hide()
	
func enter_prepare_mode() -> void:
	mode = MODE_KINEMATIC
		
	if on_right_area:
		if is_mouse_in:
			return
		pointer.show()
	else:
		modulate = COLORS["wrong_area"]
		
