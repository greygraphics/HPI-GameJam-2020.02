extends RichTextLabel


var r = 0
var b = 0

func _ready():
	pass

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
	
