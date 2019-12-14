extends RigidBody2D

signal grabbed

var is_holded : bool = false
var is_mouse_in : bool = false
var on_valid_area : bool = false setget set_on_valid_area
var is_snapped_to_line : bool = false setget set_snapped_to_line

onready var area = $Area2D
onready var pointer = $Pointer

const MAX_POSITION : float = 245.0 

var COLORS = {
	"valid_area": Color8(255, 255, 255),
	"wrong_area": Color8(207, 19, 19)
}

func _ready() -> void:
	check_valid_area()

func _input(event) -> void:
	if mode == MODE_RIGID:
		return
		
	if is_holded:
		if event is InputEventMouseMotion:
			if is_snapped_to_line:
				check_valid_area()
				return
			global_position = event.position
			fit_into_board()
		elif Input.is_action_just_released("grab") or (event is InputEventScreenTouch and not event.is_pressed()):
			is_holded = false
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	elif is_mouse_in:
		if Input.is_action_just_pressed("grab") or (event is InputEventScreenTouch and event.is_pressed()):
			emit_signal("grabbed")
			is_holded = true
			Input.set_default_cursor_shape(Input.CURSOR_MOVE)
			
func fit_into_board() -> void:
	position.x = min(MAX_POSITION, position.x)
	position.x = max(-MAX_POSITION, position.x)
	position.y = min(MAX_POSITION, position.y)
	position.y = max(-MAX_POSITION, position.y)

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
	check_valid_area()

func make_rigid() -> void:
	mode = MODE_RIGID
	pointer.hide()
	is_snapped_to_line = false
	
func enter_prepare_mode() -> void:
	mode = MODE_KINEMATIC
	
	if is_mouse_in:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
	check_valid_area()
	
func set_snapped_to_line(value:bool):
	is_snapped_to_line = value
	check_valid_area()
	
func check_valid_area() -> bool:
	if not is_snapped_to_line:
		set_on_valid_area(false)
		return false
			
	var areas = area.get_overlapping_areas()
	if areas.size() == 0:
		set_on_valid_area(true)
	else:
		set_on_valid_area(false)
		
	return on_valid_area
	
func set_on_valid_area(value:bool) -> void:
	on_valid_area = value
	
	if on_valid_area:
		if not is_mouse_in:
			pointer.show()
		modulate = COLORS["valid_area"]
	else:
		pointer.hide()
		modulate = COLORS["wrong_area"]