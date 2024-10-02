extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation.x = clamp(rotation.x, -1, 1)

func _input(event):
	if (event is InputEventMouseMotion) && (Input.is_action_pressed("Mouse_Left")):
		rotate(Vector3.UP, event.relative.x * 0.002)
		rotate_object_local(Vector3.RIGHT, event.relative.y * 0.002)
