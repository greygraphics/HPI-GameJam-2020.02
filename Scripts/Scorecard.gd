extends Node2D

var won = "Nobody"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$RichTextLabel.text = won + " won!"
	var color
	if won == "Red":
		color = Color.red
	else:
		color = Color.blue
	$RichTextLabel.push_color(color)


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
