extends Spatial


var population;


# Called when the node enters the scene tree for the first time.
func _ready():
	population = randi() % 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
