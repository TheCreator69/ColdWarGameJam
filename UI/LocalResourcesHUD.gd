extends Control

var workforce = 0
var military = 0

onready var WorkforceProgressBar = $HBoxContainer/VBoxContainer2/WorkforceProgressBar
onready var MilitaryProgressBar = $HBoxContainer/VBoxContainer2/MilitaryProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_workforce(new_workforce: int):
	WorkforceProgressBar.value = new_workforce

func set_military(new_military: int):
	MilitaryProgressBar.value = new_military

