@ - annotation:
	@onready means to wait until the scene is fully loaded to assign the variable
	@export shows a given value in the editor

$ - shorthand for the getnode() function

Doors contain spawn points, scenes contain doors 
Doors have a Door ID that corresponds to their other side
in another scene

player position should be calculated from this 

GameManager is an autoload singleton (kind of like the game class in other engines),
use it to store persistent data like the state of scenes and anything else that is persistent

Scenes are basically classes, nodes are basically objects
Scenes are like a combination of prefabs and levels (scenes) in unity or unreal

We are going to have to create some new sets that either have or do not have collision. 
Tile sets themselves manage collision based on the individual tile. For now I think this is manageable -
don't reuse the same tile for something that has collision for something that doesn't have it -
but in the future we will have two copies of each tile set, one with collision, and one without.
