extends RigidBody2D

var is_holded = false
var is_mouse_in = false

onready var area = $Area2D

var previous_position : Vector2

var COLORS = [
	Color8(110, 237, 231),
	Color8(110, 237, 182)
]

func _input(event):
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

func _physics_process(delta):
	previous_position = global_position
	
	if area.position == Vector2.ZERO:
		return
		
	var areas = area.get_overlapping_areas()
	if areas.size() == 0:
		global_position = area.global_position
		area.position = Vector2.ZERO
	
func _on_Mouse_entered():
	is_mouse_in = true
	modulate = COLORS[1]

func _on_Mouse_exited():
	is_mouse_in = false
	if not is_holded:
		modulate = COLORS[0]

func _on_Area2D_area_entered(area):
	global_position = previous_position
