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
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(to_global(translation),to_global(Vector3.FORWARD * 100))
	if result:
		result.collider._is_hit()
