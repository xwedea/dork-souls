extends Node


export var MAXHEALTH = 100


export var health : int;

func _ready():
	health = MAXHEALTH


func handle_damage(damage):
	health -= damage
	print(health)



	
