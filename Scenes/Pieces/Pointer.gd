extends Node2D

onready var board = get_node("/root/Main").find_node("Board")
onready var striker = get_parent() 
onready var spring = $SpringBase/Spring
onready var string_start_position = $StringStartPosition 

var is_stringing : bool = false

var MAX_STRENGHT : float = 300.0
var STRENGHT_MOD : float = 15.0

func _input(event):
	if not visible:
		if Input.is_action_just_released("grab"):
			is_stringing = false
			spring.scale.y = 0
		return
	
	if is_stringing:
		if event is InputEventMouseMotion:
			var string_strengt = get_string_strenght()
			spring.scale.y = string_strengt / 3
		elif Input.is_action_just_released("grab") or (event is InputEventScreenTouch and not event.is_pressed()):
			shot()
			is_stringing = false
			spring.scale.y = 0
	elif Input.is_action_just_pressed("grab") or (event is InputEventScreenTouch and event.is_pressed()):
		string_start_position.global_position = event.position
		is_stringing = true
		
func _process(delta):
	if not visible:
		return
		
	var mouse_position = get_viewport().get_mouse_position()
	var diff = mouse_position - global_position
	var angle = atan2(diff.x, diff.y)
	global_rotation = -angle
	
func get_string_strenght() -> float:
	var mouse_position = get_viewport().get_mouse_position()
	var diff = string_start_position.global_position - mouse_position
	return min(diff.length(), MAX_STRENGHT)
			
func shot():
	var string_strengt = get_string_strenght()
	
	if string_strengt == 0:
		return
	
	string_strengt *= STRENGHT_MOD
	
	var impulse : Vector2
	impulse.x = sin(global_rotation) * string_strengt
	impulse.y = -cos(global_rotation) * string_strengt
	
	board.make_everything_rigid()
	striker.apply_central_impulse(impulse)