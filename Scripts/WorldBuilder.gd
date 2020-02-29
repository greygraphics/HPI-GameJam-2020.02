extends Node


var width = 32
var height = 3
var depth = 32

func _ready():
	
	var array = []
	array.resize(width)
	for x in width:
		array[x] = []
		array[x].resize(height)
		for y in height:
			array[x][y] = []
			array[x][y].resize(depth) 
	
	var map = Image.new()
	map.load("res://Objects/map.png")
	
	for x in width:
		for z in depth:
			map.lock()
			var val = map.get_pixel(x,z).gray()
			map.unlock()
			for y in height:
				if(y == 0):
					array[x][y][z] = 1
				else:
					array[x][y][z] = val
	
	var scene = load("res://Scenes/Voxel.tscn")
	for x in width:
		for y in height:
			for z in depth:
				if(array[x][y][z] > 0.1):
					var voxel = scene.instance()
					voxel.get_child(0).set_translation(Vector3(x*2-width,y*2,z*2-depth))
					add_child(voxel)
