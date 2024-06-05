extends Node3D
class_name LuaScene

func lua_fields():
	return ["add"]

func add(obj):
	return LuaComposeObject.new(obj).add_to(self)
