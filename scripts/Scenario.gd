extends Node3D

const Player = preload("res://player.tscn")
const Target = preload("res://target.tscn")
const ComposableBox = preload("res://composable/box.tscn")
	
var player: LuaPlayer = null
var init: Callable = Callable()
var step: Callable = Callable()
var scene: LuaScene = LuaScene.new()

func spawnplayer(props = {}):
	if scene.has_node("Player"): return
	player = LuaPlayer.new(Player.instantiate())
	self.add_child(player._self)
	LuaComposeObject.apply_props(player, props)
	return player

func spawntarget(props = {}):
	props = Util.merge({ type=[ComposableBox, null, null], ttl = -1 }, props)
	var target = LuaTarget.new(Target.instantiate())
	self.add_child(target._self, true)
	LuaComposeObject.apply_props(target, props)
	return target

func _ready():
	self.add_child(scene)
	init.call()
	
func _process(delta):
	step.call(delta)
