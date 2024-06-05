extends LuaInstance
class_name LuaPlayer

func lua_fields():
	var fields = super.lua_fields()
	fields.append_array(["canmove"])
	return fields

func _init(ref):
	self._self = ref
	super(ref)

func canmove(value):
	if value != null:
		_self.can_move = value
	return _self.can_move
