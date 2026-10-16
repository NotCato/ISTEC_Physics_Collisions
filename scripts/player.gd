extends RigidBody3D

var mouse_click: Vector2
var mouse_release: Vector2
var mouse_direction: Vector2
var ball_force: Vector3

var max_drag: float = 100.0
var max_force: float = 4.0

@export var camera: Camera3D

func _input(event) -> void:
	if event  is InputEventMouseButton:
		if event.pressed == true:
			mouse_click = event.position
		else:
			mouse_release = event.position
			mouse_direction = mouse_click - mouse_release
			
			var ball_direction = Vector3 (
				camera.global_basis.x * mouse_direction.x
				+ camera.global_basis.z * mouse_direction.y
			).normalized()
			var percentage = mouse_direction.length() / max_drag
			percentage = min(percentage, 1)
			
			ball_force = ball_direction * (percentage * max_drag)
			apply_central_force(ball_force)
