extends KinematicBody

export(float) var SPEED = 10

export(NodePath) var WORLD
export(Material) var DOG_MAT
export(NodePath) var OTHER_PLAYER
export(Material) var SPLATTER_MAT
export(Color) var LIGHT_COLOR

var velocity = Vector3()
var mousePos: Vector2
var torch
onready var splatterer = $Splatterer

export(int) var JOY_INDEX = 0
export(float) var DEADZONE = 0.5
var joy_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	torch = $Torch
#	$Torch._set_color(LIGHT_COLOR)
	$OmniLight.light_color = LIGHT_COLOR
	torch.target = get_node_or_null(OTHER_PLAYER)
	splatterer.world = get_node_or_null(WORLD)
	joy_name = "joy" + str(JOY_INDEX)
	$MeshInstance.material_override = DOG_MAT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	look(delta)
	
	#character rotation
	
#	var dropPlane = Plane(Vector3.UP,translation.y)
#	var pos3d = dropPlane.intersects_ray(
#		camera.project_ray_origin(mousePos),camera.project_ray_normal(mousePos))
#	look_at(pos3d, Vector3.UP)
	
	#flashlight on/off
	if Input.is_action_just_pressed("torch" + str(JOY_INDEX)):
		if torch.is_visible_in_tree():
			torch.hide()
			$OmniLight.hide()
			torch.on = false
		else:
			torch.show()
			$OmniLight.show()
			torch.on = true
	
func move(delta):
	var hor = Input.get_action_strength(joy_name + "_right") - Input.get_action_strength(joy_name + "_left")
	var ver = Input.get_action_strength(joy_name + "_down") - Input.get_action_strength(joy_name + "_up")
	var movement = Vector3(hor,0,ver).normalized()
	movement *= SPEED * delta
	velocity = move_and_slide(movement,Vector3.UP)
	translation.y = 0


func look(delta):
	var hor = Input.get_action_strength(joy_name + "_look-right") - Input.get_action_strength(joy_name + "_look-left")
	var ver = Input.get_action_strength(joy_name + "_look-up") - Input.get_action_strength(joy_name + "_look-down")
	var rot = atan2(-hor,ver)
#	if abs(hor) > DEADZONE or abs(ver) > DEADZONE:
	rotation_degrees.y = rad2deg(rot)

func _is_hit():
	splatterer._is_hit(JOY_INDEX + 1)
