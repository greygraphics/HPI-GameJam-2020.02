extends Spatial

export(int) var JOY_INDEX = 0
export(float) var DEADZONE = 0.5
var joy_name = ""

func _ready():
	joy_name = "joy" + str(JOY_INDEX)

func _process(delta):
		move(delta)
		look(delta)
	
func move(delta):
	var hor = Input.get_action_strength(joy_name + "_right") - Input.get_action_strength(joy_name + "_left")
	var ver = Input.get_action_strength(joy_name + "_down") - Input.get_action_strength(joy_name + "_up")
	var movement = Vector3(hor,0,ver)
	translation += movement * 4 * delta

func look(delta):
	var hor = Input.get_action_strength(joy_name + "_look-right") - Input.get_action_strength(joy_name + "_look-left")
	var ver = Input.get_action_strength(joy_name + "_look-up") - Input.get_action_strength(joy_name + "_look-down")
	var rot = atan2(ver,hor)
	if abs(hor) > DEADZONE or abs(ver) > DEADZONE:
		rotation_degrees.y = rad2deg(rot)
