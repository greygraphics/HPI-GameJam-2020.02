extends Spatial

var mat1
var mat2
var world: Spatial

func _ready():
	mat1 = ResourceLoader.load("res://Materials/Cube_clr1.tres")
	mat2 = ResourceLoader.load("res://Materials/Cube_clr2.tres")


func _is_hit():
	var player_pos = to_global(translation)
	var i = 0
	for voxel in world.get_children():
		var vox_pos = voxel.get_child(0).translation
		var dist = player_pos.distance_to(vox_pos)
		i+=1
		if(dist < 5):
			var mesh = voxel.get_child(0).get_child(0)
			if(mesh):
				mesh.set_material_override(mat1)
				set_process(true)
			else: 
				mesh.set_material_override(mat2)
				set_process(true)
				
func _process(delta):
	if Input.is_action_just_pressed("torch"):
		_is_hit()
