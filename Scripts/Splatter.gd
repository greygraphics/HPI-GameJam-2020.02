extends Spatial

var mat1
var mat2

var world: Spatial

var default

var state_array

func _ready():
	mat1 = ResourceLoader.load("res://Materials/Cube_clr1.tres")
	mat2 = ResourceLoader.load("res://Materials/Cube_clr2.tres")


func _is_hit(n):
	var player_pos = to_global(translation)
	default = ResourceLoader.load("res://Materials/Cube_default.tres")
	
	var i = 0
#	var world = get_tree().get_root().get_node("TestLevelRaphael").find_node("World")
	for voxel in world.get_children():
		var vox_pos = voxel.get_child(0).translation
		var dist = player_pos.distance_to(vox_pos)
		i+=1

		var mesh = voxel.get_child(0).get_child(0)
		if(dist < 5):
			var after = n
			var before = 0
			var material = mesh.get_material_override()
			if(material):
				var clr = material.albedo_color;
				if(clr.b == 0):
					before = 1
				elif(clr.r == 0):
					before = 2
			
			set_score(before,after)
			
			if(after == 1):
				mesh.set_material_override(mat1)
			else:
				mesh.set_material_override(mat2)

func set_score(before, after):
	var gui = get_tree().get_root().get_node("TestLevel").find_node("GUI").get_child(0).get_child(0)
	if(before == 0):
		if(after == 1):
			gui.r += 1
		else:
			gui.b += 1
	elif(before == 1):
		if(after == 2):
			gui.r -= 1
			gui.b += 1
	elif(before == 2):
		if(after == 1):
			gui.b -= 1
			gui.r += 1
		
