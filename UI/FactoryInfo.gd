extends Control

var currentWorkers = 0
var maxWorkers = 0

onready var FactoryLabel = $Panel/VBoxContainer/FactoryLabel
onready var WorkersAmountLabel = $Panel/VBoxContainer/HBoxContainer/WorkersAmountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_factory_label(label: String):
	FactoryLabel.text = label

func set_worker_amount(workers: int):
	currentWorkers = workers
	_set_workers_label()
	
func set_max_worker_amount(max_workers: int):
	maxWorkers = max_workers
	_set_workers_label()
	
func _set_workers_label():
	WorkersAmountLabel.text = str(currentWorkers) + "/" + str(maxWorkers)
