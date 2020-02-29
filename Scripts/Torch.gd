extends Spatial

export(NodePath) var CAMERA

var camera: Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node_or_null(CAMERA)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dropPlane = Plane(Vector3.UP,translation.y)
	var mouseMos = dropPlane.intersects_ray(
		camera.project_ray_origin(
