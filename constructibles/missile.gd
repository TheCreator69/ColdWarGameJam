extends Spatial

var missile_build_progress = 0.0
var target_missile_build_progress = 0.0

export var low_range_build_duration = 10.0
export var mid_range_build_duration = 20.0
export var long_range_build_duration = 30.0

var missile_type = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_type_initial(missile_type_in):
	missile_type = missile_type_in
	missile_build_progress = 0.0
	add_to_group(missile_type)
	if missile_type == "Low":
		target_missile_build_progress = low_range_build_duration
	if missile_type == "Mid":
		target_missile_build_progress = mid_range_build_duration
	if missile_type == "Long":
		target_missile_build_progress = long_range_build_duration
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if missile_type == null:
		return
	if missile_build_progress < target_missile_build_progress:
		missile_build_progress += 10*delta
	if missile_build_progress >= target_missile_build_progress:
		complete_missile_build()

func complete_missile_build():
	$construction_mesh.visible = false
	if missile_type == "Low":
		$low_range_mesh.visible = true
	if missile_type == "Mid":
		$mid_range_mesh.visible = true
	if missile_type == "Long":
		$long_range_mesh.visible = true
