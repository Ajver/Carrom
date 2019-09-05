extends Node2D

var Disk = load("res://Scenes/Disks/Disk.tscn")
var MainDisk = load("res://Scenes/Disks/MainDisk.tscn")

const DISKS_COLORS = [
	Color8(204, 204, 204),
	Color8(61, 61, 61),
	Color8(112, 7, 7)
]

var has_main_disk : bool = false

const DISK_D : float = 30.0
const MIN_DISK_SPEED : float = 0.05

var in_prepare_mode = true

func new_game() -> void:
	remove_all_children()
	call_deferred("register_new_disks")
	#register_new_disks()
	
func remove_all_children() -> void:
	for disk in get_children():
		disk.queue_free()
	
func register_new_disks() -> void:
	var SQRT_3 = 1.732
	
	create_disk(Vector2.ZERO, DISKS_COLORS[2])
	create_6_disks(DISK_D, 0.0)
	create_6_disks(DISK_D*2, 0.0)
	create_6_disks(DISK_D * SQRT_3, PI / 6.0)
	
	var main_disk = MainDisk.instance()
	add_child(main_disk)
	main_disk.position = Vector2(0, DISK_D * 5)
	
func create_6_disks(R:float, angle:float):
	var PI_OVER_3 = PI / 3.0
	
	for i in range(6):
		var disk_x = sin(angle) * R
		var disk_y = cos(angle) * R
		
		create_disk(Vector2(disk_x, disk_y), DISKS_COLORS[i%2])
		
		angle += PI_OVER_3
		
func create_disk(disk_position, disk_modulate):
	var disk = Disk.instance()
	add_child(disk)
	disk.modulate = disk_modulate
	disk.set_disk_manager(self)
	disk.position = disk_position
		
func _process(delta):
	if in_prepare_mode:
		return
		
	for disk in get_children():
		if disk.linear_velocity.length() > MIN_DISK_SPEED:
			return
			
	enter_prepare_mode()
		
func make_everything_rigid() -> void:
	for disk in get_children():
		disk.make_rigid()
		
	yield(get_tree().create_timer(0.1), "timeout")
	in_prepare_mode = false
	
func enter_prepare_mode() -> void:
	for disk in get_children():
		disk.enter_prepare_mode()
	
	in_prepare_mode = true

func disk_reached(disk) -> void:
	#call_deferred("remove_child", disk)
	pass