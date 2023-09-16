extends Control

var currentWorkers = 0
var maxWorkers = 0

onready var FactoryLabel = $Panel/VBoxContainer/FactoryLabel
onready var WorkersAmountLabel = $Panel/VBoxContainer/HBoxContainer/WorkersAmountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_factory_label(label: String):
	FactoryLabel.text = label

func set_worker_amount(workers: int):
	currentWorkers = workers
	WorkersAmountLabel.text = str(workers)
