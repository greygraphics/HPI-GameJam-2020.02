extends Spatial

var target: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	# Test if other player is in cone
	var my_global_translation = to_global(translation)
	var target_global_translation = to_global(target.translation)
	var direction = to_local(my_global_translation.direction_to(target_global_translation))
	var dot = Vector3.FORWARD.dot(direction)
	var angle = acos(dot)
	if abs(angle) < 25:
		print(target.name + " is in sight!")
	
	pass
