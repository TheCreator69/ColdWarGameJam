extends Control

onready var Satisfaction = $HBoxContainer/Satisfaction
onready var Provisions = $VBoxContainer/HBoxContainer/Provisions
onready var Threat = $VBoxContainer/HBoxContainer2/Threat

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_satisfaction(new_satisfaction: int):
	Satisfaction.text = str(new_satisfaction)

func set_provisions(new_provisions: int):
	Provisions.text = str(new_provisions)
	
func set_threat(new_threat: int):
	Threat.text = str(new_threat)
