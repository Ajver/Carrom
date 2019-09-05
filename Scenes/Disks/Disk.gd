extends RigidBody2D

var disk_manager = null

func set_disk_manager(dm):
	disk_manager = dm
	
func make_rigid() -> void:
	mode = MODE_RIGID
	
func enter_prepare_mode() -> void:
	mode = MODE_STATIC

func _on_Corner_entered(area):
	if area.is_in_group("corners"):
		queue_free()
		disk_manager.disk_reached(self)