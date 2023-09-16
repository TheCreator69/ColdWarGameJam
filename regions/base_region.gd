extends Spatial

var base_colour

var population;


# Called when the node enters the scene tree for the first time.
func _ready():
	population = randi() % 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_highlight_colour(colour,new_base_colour=false):
	if new_base_colour:
		base_colour = colour
	var mesh_surface_mat = $MeshInstance.get_surface_material(0)
	var new_mesh_surface_mat = mesh_surface_mat.duplicate()
	var colour_to_set = colour
	if colour == null:
		colour_to_set = base_colour
	new_mesh_surface_mat.albedo_color = colour_to_set
	$MeshInstance.set_surface_material(0,new_mesh_surface_mat)
