extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thisMaterial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	thisMaterial=get_surface_material(0)

	# 1 correspond to FEATURE_EMISSION as per docuementation
	thisMaterial.set_feature(1,true)
	thisMaterial.set_emission_energy(3.0)
	pass
