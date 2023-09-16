extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton :
		var camera = $Camera#get_node("-Camera")
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 500
		
		var cursorPos = Plane(Vector3.UP, transform.origin.y).intersects_ray(from, to)
		print(cursorPos)

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
	else:
		$Highlight.visible = false
