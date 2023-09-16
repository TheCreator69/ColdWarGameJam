extends Spatial

export var regions_per_player = 20
export var region_origin = Vector2(-50.0,0)
export var region_seed = 0
export var region_spread = 20.0

func _ready():
	var base_region = load("res://regions/base_region.tscn")
	
	var rng = RandomNumberGenerator.new()
	rng.seed = region_seed
	var existing_coords = []
	for ind_region in range(regions_per_player):
		var accepted_coord = false
		var cart   = Vector2(0,0)
		while not accepted_coord:
			var x_coord = rng.randfn(0.0,1.0)
			var y_coord = rng.randfn(0.0,1.0)
			var no_overlaps = true
			var trial_cart  = region_origin + region_spread * Vector2(x_coord,y_coord)
			for existing_coord in existing_coords:
				if trial_cart.distance_to(existing_coord) < 10.0:
					no_overlaps = false
			accepted_coord = no_overlaps
			if accepted_coord:
				cart = trial_cart
		
		var new_region = base_region.instance()
		$player_regions.add_child(new_region)
		new_region.global_transform.origin = Vector3(cart.x,0.0,cart.y)
		existing_coords.append(cart)
		

