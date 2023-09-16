extends Spatial

export var regions_per_player = 10


func _ready():
	var base_region = load("res://regions/base_region.tscn")
	for ind_region in range(regions_per_player):
		var theta  = 2*PI*(float(ind_region)+rand_range(0,0.7))/float(regions_per_player)
		var radius = rand_range(50.0,100.0)
		var cart   = polar2cartesian(radius,theta)
		var new_region = base_region.instance()
		$player_regions.add_child(new_region)
		new_region.global_transform.origin = Vector3(cart.x,0.0,cart.y)
		

