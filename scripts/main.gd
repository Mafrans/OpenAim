extends Node3D

@onready var loader = $ScenarioLoader

# Called when the node enters the scene tree for the first time.
func _ready():
	loader.load_scenario("res://scenarios/1wall6targets.lua")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
