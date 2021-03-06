extends RichTextLabel


var r = 0
var b = 0

var time_start = 0
var time_now = 0

export(int) var TIME_LIMIT

func _ready():
	time_start = OS.get_unix_time()

func _process(delta):
	set_text("")
	push_align(RichTextLabel.ALIGN_CENTER)
	add_text("Score: ")
	push_color(Color(1,0.5,0.5))
	add_text(str(r))
	push_color(Color(1,1,1))
	add_text(" : ")
	push_color(Color(0.5,0.5,1))
	add_text(str(b))
	
	
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var seconds = elapsed % 60
	var str_elapsed = "%02d" % [TIME_LIMIT - seconds] 
	
	if(elapsed > TIME_LIMIT):
		if r == b:
			get_tree().change_scene("res://Scenes/Scorecard_nobody.tscn")
		elif r > b:
			get_tree().change_scene("res://Scenes/Scorecard_blue.tscn")
		else:
			get_tree().change_scene("res://Scenes/Scorecard_red.tscn")
	
	push_color(Color(1,1,1))
	add_text("\n"+str_elapsed)
	
