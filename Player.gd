extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func getEnemies():
	var enemies = []
	for child in get_parent().get_children():
		if child != self and child.is_in_group("Player"):
			enemies.append(child)
	return enemies

func getRegions():
	var regions = []
	for region in get_children():
		if region.is_in_group("Region")
			regions.append(region)
	return regions
		 
