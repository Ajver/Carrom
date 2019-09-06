extends RigidBody2D

var is_holded = false
var is_mouse_in = false
var on_right_area : bool = true

onready var area = $Area2D
onready var pointer = $Pointer

var previous_position : Vector2

var COLORS = [
	Color8(110, 237, 231),
	Color8(110, 237, 182)
]

func _input(event) -> void:
	if mode == MODE_RIGID:
		return
		
	if Input.is_key_pressed(KEY_Q):
		area.global_position = Vector2(500, 300)
		
	if is_holded:
		if event is InputEventMouseMotion:
			area.global_position = event.position
		elif Input.is_action_just_released("grab"):
			is_holded = false
			modulate = COLORS[0]
			area.position = Vector2.ZERO
	elif is_mouse_in:
		if Input.is_action_just_pressed("grab"):
			is_holded = true

func _physics_process(delta) -> void:		
	previous_position = global_position
		
	var areas = area.get_overlapping_areas()
	if areas.size() == 0:
		on_right_area = true
		if mode == MODE_KINEMATIC and not is_holded:
			pointer.show()
		var bodies = area.get_overlapping_bodies()
		if bodies.size() == 0:
			global_position = area.global_position
			area.position = Vector2.ZERO
	else:
		pointer.hide()
		on_right_area = false
	
func _on_Mouse_entered() -> void:
	is_mouse_in = true
	
	if mode == MODE_RIGID:
		return
	
	modulate = COLORS[1]
	pointer.hide()

func _on_Mouse_exited() -> void:
	is_mouse_in = false
	
	if mode == MODE_RIGID:
		return
		
	if not is_holded:
		modulate = COLORS[0]
		
	if on_right_area:
		pointer.show()

func _on_Area2D_body_entered(body):
	_on_wrong_area_entered()
	
func _on_Area2D_area_entered(area) -> void:
	_on_wrong_area_entered()

func _on_wrong_area_entered() -> void:
	if mode == MODE_RIGID:
		return
		
	global_position = previous_position

func is_on_right_area() -> bool:
	return on_right_area

func make_rigid() -> void:
	mode = MODE_RIGID
	pointer.hide()
	
func enter_prepare_mode() -> void:
	mode = MODE_KINEMATIC
	
	if is_mouse_in:
		return
		
	if on_right_area:
		pointer.show()
