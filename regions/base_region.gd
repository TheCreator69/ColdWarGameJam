extends Spatial



export var minPopulation = 10
export var maxPopulation = 200

export var lowRange = 50
export var midRange = 200
export var longRange = 1000

var population

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Region")
	population = randi() % (maxPopulation - minPopulation) + minPopulation


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	

func getMissiles( rangeOfFire: string ):
	var missiles = []
	for child in get_children():
		if child.is_in_group(rangeOfFire):
			missiles.append(child);
	return missiles

func getMilitaryThread() -> float:
	var threadLevel = 0
	for enemy in get_parent().getEnemies():
		for region in enemy.getRegions()			
			for missile in region.getMissiles("Low"):
				if self.global_position.distance_to(region.global_position)	<= lowRange:
					threadLevel += 1
			for missile in region.getMissiles("Mid"):
				if self.global_position.distance_to(region.global_position)	<= midRange:
					threadLevel += 1
			for missile in region.getMissiles("High"):
				if self.global_position.distance_to(region.global_position)	<= highRange:
					threadLevel += 1					
	return threadLevel
