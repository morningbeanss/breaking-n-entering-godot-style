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
