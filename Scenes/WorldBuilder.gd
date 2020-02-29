extends Node


var width = 10
var height = 3
var depth = 10

func _ready():
	
	var array = []
	array.resize(width)
	for x in width:
		array[x] = []
		array[x].resize(height)
		for y in height:
			array[x][y] = []
			array[x][y].resize(depth) 
	
	var map = load("res://Objects/map.png")
	
	for x in width:
		for y in height:
			for z in depth:
				if(y == 0):
					array[x][y][z] = 1
				else:
					array[x][y][z] = map.get_pixel(x,z);
	
	var scene = load("res://Scenes/Voxel.tscn")
	for x in width:
		for y in height:
			for z in depth:
				if(array[x][y][z] == 1):
					var voxel = scene.instance()
					voxel.get_child(0).set_translation(Vector3(x-width/2,y,z-depth/2))
					add_child(voxel)
