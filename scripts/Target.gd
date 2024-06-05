extends Node3D
class_name Target

const TargetMaterial = preload("res://materials/target.material")

var health = 1
var on_death: Callable

func _ready():
	apply_material()

func apply_material(parent = self):
	var meshes = parent.find_children("*", "MeshInstance3D", true, false) as Array[MeshInstance3D]
	for mesh in meshes:
		mesh.material_override = TargetMaterial

func damage():
	health -= 1
	if health <= 0:
		die()

func die():
	on_death.call()
	queue_free()
