extends Resource

class_name Equipment

enum Categories {
	WEAPON,
	BODY,
	ABILITY,
	UNIVERSAL
}

@export var label : String
@export var preview : Texture
@export var hint : String
@export var category : Categories

var linked_out : DNDOut
