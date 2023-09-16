extends Control

const LocalResourceSimple = preload("res://UI/LocalResourcesSimple.tscn")
const LocalResourceDetailed = preload("res://UI/LocalResourceDetailed.tscn")

var widgets_for_regions = {}
var hidden_simple_widget = null
var complex_widget = null

const FactoryInfo = preload("res://UI/FactoryInfo.tscn")
const FactoryBuildInfo = preload("res://UI/FactoryBuildInfo.tscn")

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_simple_widgets(player_regions: Spatial):
	for region in player_regions.get_children():
		var new_widget = LocalResourceSimple.instance()
		var screen_coord = get_node("../Camera").unproject_position(region.global_transform.origin)
		new_widget.set_position(screen_coord)
		
		$ResourceWidgets.add_child(new_widget)
		widgets_for_regions[region] = new_widget

func show_complex_widget(region: Spatial):
	if widgets_for_regions.has(region):
		widgets_for_regions[region].visible = false
		
		complex_widget = LocalResourceDetailed.instance()
		$ResourceWidgets.add_child(complex_widget)
