extends LuaInstance
class_name LuaTarget

func lua_fields():
	var fields = super.lua_fields()
	fields.append_array(["health", "type", "ondeath"])
	return fields

func _init(ref):
	self._self = ref
	super(ref)

func type(type):
	var node = LuaComposeObject.new(type).add_to(_self)
	node.scale(self.size())
	_self.apply_material(node._self)

func ondeath(callable):
	_self.on_death = callable

func health(value):
	if value != null:
		_self.health = value
	return _self.health
