extends Node

const Scenario = preload("res://scenario.tscn")
const ComposableBox = preload("res://composable/box.tscn")
const ComposablePhysicsBox = preload("res://composable/physics-box.tscn")
const ComposableSphere = preload("res://composable/sphere.tscn")
const ComposablePhysicsSphere = preload("res://composable/physics-sphere.tscn")

var lua: LuaAPI = LuaAPI.new()
var scenario = null

func _print(message):
	print(message)

func load_scenario(file_path: String):
	scenario = Scenario.instantiate()
	
	lua.object_metatable.permissive = false
	lua.push_variant("print", _print)
	lua.push_variant("spawnplayer", scenario.spawnplayer)
	lua.push_variant("spawntarget", scenario.spawntarget)
	
	# load composables
	lua.push_variant("ComposableBox", LuaComposable.new(ComposableBox))
	lua.push_variant("ComposablePhysicsBox", LuaComposable.new(ComposablePhysicsBox))
	lua.push_variant("ComposableSphere", LuaComposable.new(ComposableSphere))
	lua.push_variant("ComposablePhysicsSphere", LuaComposable.new(ComposablePhysicsSphere))
	
	lua.bind_libraries(["math"])
	# load custom libraries
	var err = lua.do_file("res://lib/composable.lua")
	
	err = lua.do_file(file_path)
	if (err != null):
		print("ERROR:", err.message)
		return
	
	scenario.init = lua.pull_variant("init")
	scenario.step = lua.pull_variant("step")
	
	lua.push_variant("scene", scenario.scene)
	
	add_child(scenario)
