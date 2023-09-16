extends Control

var occupiedWorkers = 0
var timeLeft = 0

onready var FactoryLabel = $Panel/VBoxContainer/FactoryLabel
onready var WorkersAmountLabel = $Panel/VBoxContainer/HBoxContainer/WorkersAmountLabel
onready var TimeLeftBar = $Panel/VBoxContainer/HBoxContainer2/TimeLeftBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_factory_label(label: String):
	FactoryLabel.text = label

func set_occupied_worker_amount(workers: int):
	occupiedWorkers = workers
	WorkersAmountLabel.text = occupiedWorkers
	
func set_time_left(time_left: int):
	timeLeft = time_left
	TimeLeftBar.value = timeLeft
