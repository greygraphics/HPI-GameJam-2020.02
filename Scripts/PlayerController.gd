extends KinematicBody

export(float) var SPEED = 1

export(NodePath) var CAMERA
var camera : Camera
var velocity = Vector3()
var mousePos: Vector2
var torch

# Called when the node enters the scene tree for the first time.
func _ready():
	torch = $Torch
	camera = get_node_or_null(CAMERA)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector3()
	movement.x += Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.z += Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	movement *= SPEED
	velocity = move_and_slide(movement,Vector3.UP)
	
	#character rotation
	
	var dropPlane = Plane(Vector3.UP,translation.y)
	var pos3d = dropPlane.intersects_ray(
		camera.project_ray_origin(mousePos),camera.project_ray_normal(mousePos))
	look_at(pos3d, Vector3.UP)
	
	#flashlight on/off
	if Input.is_action_just_pressed("torch"):
		if torch.is_visible_in_tree():
			torch.hide()
		else:
			torch.show()
	
	
func _input(event):
	if event is InputEventMouseMotion:
		mousePos = event.position
