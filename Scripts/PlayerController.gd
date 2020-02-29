extends KinematicBody

export(float) var SPEED = 1

var velocity = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector3()
	movement.x += Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.z += Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	movement *= SPEED
	velocity = move_and_slide(movement,Vector3.UP)
