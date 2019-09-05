extends Node2D

var Disk = load("res://Scenes/Disks/Disk.tscn")
var MainDisk = load("res://Scenes/Disks/MainDisk.tscn")

const DISKS_COLORS = [
	Color8(204, 204, 204),
	Color8(61, 61, 61)
]

var disks_pool : Array = []
var foo : Array = []
var main_disk = null
var has_main_disk : bool = false

const DISK_D = 30

func _ready() -> void:
	hide()
	create_disks()
	
func create_disks() -> void:
	for i in range(19):
		var disk = Disk.instance()
		disks_pool.append(disk)
		disk.modulate = DISKS_COLORS[i%2]
		
	main_disk = MainDisk.instance()

func new_game() -> void:
	get_all_disks_from_pool()
	set_disks_start_position()
	show()
	
func set_disks_start_position() -> void:
	get_child(0).position = Vector2.ZERO

	var SQRT_3 = 1.732
	
	set_position_of_6_disks(1, DISK_D, 0.0)
	set_position_of_6_disks(7, DISK_D*2, 0.0)
	set_position_of_6_disks(13, DISK_D * SQRT_3, PI / 6.0)
	
	main_disk.position = Vector2(0, DISK_D * 5)
	main_disk.collision_layer = 1
	
func set_position_of_6_disks(from:int, R:float, angle:float):
	var PI_OVER_3 = PI / 3.0
	
	for i in range(from, from+6):
		var disk = get_child(i)
		var disk_x = sin(angle) * R
		var disk_y = cos(angle) * R
		disk.position = Vector2(disk_x, disk_y)
		angle += PI_OVER_3
	
func get_all_disks_from_pool() -> void:
	for i in range(disks_pool.size()):
		add_child(disks_pool.pop_back())
		
	if not has_main_disk:
		main_disk.collision_layer = 0
		add_child(main_disk)
		has_main_disk = true