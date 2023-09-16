extends Control

var satisfaction = 0
var provisions = 0

onready var SatisfactionProgressBar = $HBoxContainer/VBoxContainer2/SatisfactionProgressBar
onready var ProvisionsProgressBar = $HBoxContainer/VBoxContainer2/ProvisionsProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_satisfaction(new_satisfaction: int):
	SatisfactionProgressBar.value = new_satisfaction

func set_provisions(new_provisions: int):
	ProvisionsProgressBar.value = new_provisions
	
