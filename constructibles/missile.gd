extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_type(missile_type):
	add_to_group(missile_type)
	if missile_type == "Low":
		$low_range_mesh.visible = true
	if missile_type == "Mid":
		$mid_range_mesh.visible = true
	if missile_type == "Long":
		$long_range_mesh.visible = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
