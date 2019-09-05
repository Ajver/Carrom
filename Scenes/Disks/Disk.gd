extends RigidBody2D

func make_rigid() -> void:
	mode = MODE_RIGID
	
func enter_preapare_mode() -> void:
	mode = MODE_STATIC