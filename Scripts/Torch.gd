extends Spatial

var target: Spatial
var in_sight = false

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
	var direction = to_local(my_global_translation.direction_to(target_global_translation)).normalized()
	var dot = Vector3.FORWARD.dot(direction)
	if dot > 0.9:
		if !in_sight:
			print(target.name + " is in sight!")
			in_sight = true;
	else:
		if in_sight:
			print(target.name + " is not in sight!")
			in_sight = false;
	
	pass
