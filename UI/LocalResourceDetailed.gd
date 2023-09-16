extends Control

onready var MilitaryFactory = $HBoxContainer/VBoxContainer/MilitaryFactory
onready var FoodFactory = $HBoxContainer/VBoxContainer2/FoodFactory
onready var MilitaryStruggle = $HBoxContainer/MilitaryStruggle/VBoxContainer/MilitaryStruggle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_military_factory(current, total):
	MilitaryFactory.text = str(current) + "/" + str(total)

func set_food_factory(current, total):
	FoodFactory.text = str(current) + "/" + str(total)

func set_military_struggle(new_struggle: int):
	MilitaryStruggle.text = str(new_struggle)
