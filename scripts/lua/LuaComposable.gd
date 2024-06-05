extends Object
class_name LuaComposable

var _self
func _init(ref):
	self._self = ref
	
func lua_fields():
	return ["instantiate"]

func instantiate():
	return LuaInstance.new(_self.instantiate())

