extends Spatial

var base_colour


export var minPopulation = 10
export var maxPopulation = 200

export var lowRange = 50
export var midRange = 200
export var longRange = 1000

var total_population
var allocated_military_population
var allocated_produce_population

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Region")
	total_population = randi() % (maxPopulation - minPopulation) + minPopulation
	


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
	
func get_unallocated_population():
	return total_population - allocated_military_population - allocated_produce_population
	
func assign_population_to_produce(num_pop):
	if num_pop < 0:
		return
	var allocatable_pop = min(get_unallocated_population(), num_pop)
	allocated_produce_population += allocatable_pop
	return
	
func assign_population_to_military(num_pop):
	if num_pop < 0:
		return
	var allocatable_pop = min(get_unallocated_population(), num_pop)
	allocated_military_population += allocatable_pop
	return
	
	
func getMissiles( rangeOfFire ):
	var missiles = []
	for child in get_children():
		if child.is_in_group(rangeOfFire):
			missiles.append(child);
	return missiles

func getMilitaryThreat() -> float:
	var threatLevel = 0
	for enemy in get_parent().getEnemies():
		for region in enemy.getRegions():
			for missile in region.getMissiles("Low"):
				if self.global_position.distance_to(region.global_position)	<= lowRange:
					threatLevel += 1
			for missile in region.getMissiles("Mid"):
				if self.global_position.distance_to(region.global_position)	<= midRange:
					threatLevel += 1
			for missile in region.getMissiles("High"):
				if self.global_position.distance_to(region.global_position)	<= longRange:
					threatLevel += 1
	return threatLevel
