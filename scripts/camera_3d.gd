extends Camera3D

@onready var ball: RigidBody3D = $"../Ball"
@export var offset: Vector3

func _process(_delta: float) -> void:
	position = ball.position + offset
	look_at(ball.position)
