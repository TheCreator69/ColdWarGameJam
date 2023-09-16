extends Control

var military_struggle = 50

onready var MilitaryStruggle = $HBoxContainer/MilitaryStruggle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_military_struggle(new_struggle: int):
	MilitaryStruggle.text = str(new_struggle)
