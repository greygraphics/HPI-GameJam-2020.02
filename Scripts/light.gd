extends Spatial

export(NodePath) var CAMERA

var camera: Camera
var mousePos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node_or_null(CAMERA)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dropPlane = Plane(Vector3.UP,translation.x)
	var pos3d = dropPlane.intersects_ray(
		camera.project_ray_origin(mousePos),camera.project_ray_normal(mousePos))
	if pos3d:
		look_at(pos3d,Vector3.UP)
	print(pos3d)

func _input(event):
	if event is InputEventMouseMotion:
		mousePos = event.position
		
