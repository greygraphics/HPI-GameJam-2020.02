extends Node

var player
var mat1
var mat2

func _ready():
	player = get_parent()
	mat1 = ResourceLoader.load("res://Materials/Cube_clr1.tres")
	mat2 = ResourceLoader.load("res://Materials/Cube_clr2.tres")


func _process(delta):
	var player_pos = player.translation
	var world = get_tree().get_root().get_node("TestLevel").find_node("World")
	var i = 0
	for voxel in world.get_children():
		var vox_pos = voxel.get_child(0).translation
		var dist = (player_pos-vox_pos).length()
		i+=1
		if(dist < 5):
			var mesh = voxel.get_child(0).get_child(0)
			if(mesh):
				mesh.set_material_override(mat1)
				set_process(true)
			else: 
				mesh.set_material_override(mat2)
				set_process(true)
