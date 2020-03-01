extends Spatial

var target: Spatial
var in_sight = false
var on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if !on: 
		return
	# Test if other player is in cone
	var my_global_translation = to_global(translation)
	my_global_translation.y = 0
	var target_global_translation = to_global(target.translation)
	target_global_translation.y = 0
	var direction = to_local(my_global_translation.direction_to(target_global_translation)).normalized()
	var dot = Vector3.FORWARD.dot(direction)
#	if dot < 0.9:
#		return
		
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(to_global(translation),to_global(Vector3.FORWARD * 100))
	if result:
		result.collider._is_hit()
