extends Spatial

var currently_highlighted_region = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.create_simple_widgets($Player1/RegionSpawner/player_regions)

func _input(event):
	if event is InputEventMouseButton :
		var camera = $Camera
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 500
		
		var cursorPos = Plane(Vector3.UP, transform.origin.y).intersects_ray(from, to)
		var player_nodes = get_tree().get_nodes_in_group("Player")
		for player in player_nodes:
			player.click_event_region(currently_highlighted_region, cursorPos)

func _physics_process(delta):
	var RAY_LENGTH = 500
	var space_state = get_world().direct_space_state
	var cam = $Camera
	var mousepos = get_viewport().get_mouse_position()
	#var from = camera.project_ray_origin(event.position)
	#var to = from + camera.project_ray_normal(event.position) * ray_length
	
	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
	var result = space_state.intersect_ray(origin, end)
	if result:
		$Highlight.visible = true
		$Highlight.global_transform.origin = result.position
		var result_region = result.collider.get_parent().get_parent()
		if currently_highlighted_region == result_region:
			pass
		else:
			if currently_highlighted_region:
				currently_highlighted_region.set_highlight_colour(null)
			
			result_region.set_highlight_colour(Color.green)
			currently_highlighted_region = result_region
	else:
		$Highlight.visible = false
		if currently_highlighted_region:
			currently_highlighted_region.set_highlight_colour(null)
		currently_highlighted_region = null
