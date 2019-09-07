extends RigidBody2D

var pieces_manager = null

func set_pieces_manager(pm):
	pieces_manager = pm
	
func make_rigid() -> void:
	mode = MODE_RIGID
	
func enter_prepare_mode() -> void:
	mode = MODE_STATIC

func _on_Corner_entered(area):
	if area.is_in_group("corners"):
		queue_free()
		pieces_manager.disk_reached(self)