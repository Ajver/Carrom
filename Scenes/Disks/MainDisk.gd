extends RigidBody2D

var is_holded = false
var is_mouse_in = false
var on_right_area : bool = true

onready var area = $Area2D
onready var pointer = $Pointer

var COLORS = {
	"valid_area": Color8(255, 255, 255),
	"wrong_area": Color8(207, 19, 19)
}

func _input(event) -> void:
	if mode == MODE_RIGID:
		return
		
	if Input.is_key_pressed(KEY_Q):
		area.global_position = Vector2(500, 300)
		
	if is_holded:
		if event is InputEventMouseMotion:
			global_position = event.position
		elif Input.is_action_just_released("grab"):
			is_holded = false
	elif is_mouse_in:
		if Input.is_action_just_pressed("grab"):
			is_holded = true

func _physics_process(delta) -> void:
	var areas = area.get_overlapping_areas()
	if areas.size() == 0:
		on_right_area = true
		modulate = COLORS["valid_area"]
		#if mode == MODE_KINEMATIC and not is_holded:
		#	pointer.show()
		var bodies = area.get_overlapping_bodies()
		if bodies.size() == 0:
			# OK!
			pass
	else:
		pointer.hide()
		on_right_area = false
	
func _on_Mouse_entered() -> void:
	is_mouse_in = true
	
	if mode == MODE_RIGID:
		return
	
	pointer.hide()

func _on_Mouse_exited() -> void:
	is_mouse_in = false
	
	if mode == MODE_RIGID:
		return
		
	if on_right_area:
		pointer.show()

func _on_Area2D_body_entered(body):
	_on_wrong_area_entered()
	
func _on_Area2D_area_entered(area) -> void:
	_on_wrong_area_entered()

func _on_wrong_area_entered() -> void:
	if mode == MODE_RIGID:
		return
	
	modulate = COLORS["wrong_area"]

func _on_wrong_area_exited(area):
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
		
