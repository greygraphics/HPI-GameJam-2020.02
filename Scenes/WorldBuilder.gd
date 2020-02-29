extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://Scenes/Voxel.tscn")
	var voxel = scene.instance()
	add_child(voxel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
