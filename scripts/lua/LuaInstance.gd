extends Object
class_name LuaInstance

var _self
var _parent
func _init(ref: Node3D):
	self._self = ref
	
func lua_fields():
	return ["position", "move", "rotation", "rotate", "size", "scale", "parent", "gravity"]

func parent():
	if _parent == null:
		_parent = _self.get_parent_node_3d()
	if _parent is LuaScene:
		_parent = false # don't allow parenting past the base scene
	return _parent

func position(position = null):
	if position != null:
		if parent():
			position = position.duplicate()
			position[0] /= parent().scale.x
			position[1] /= parent().scale.y
			position[2] /= parent().scale.z
		_self.position.x = position[0]
		_self.position.y = position[1]
		_self.position.z = position[2]
	return [_self.position.x, _self.position.y, _self.position.z]

func move(position):
	return self.position([
		_self.position.x + position[0], 
		_self.position.y + position[1], 
		_self.position.z + position[2]
	])
	
func rotation(rotation = null):
	if rotation != null:
		_self.rotation.x = rotation[0]
		_self.rotation.y = rotation[1]
		_self.rotation.z = rotation[2]
	return [_self.rotation.x, _self.rotation.y, _self.rotation.z]

func rotate(rotation):
	return self.rotation([
		_self.rotation.x + rotation[0], 
		_self.rotation.y + rotation[1], 
		_self.rotation.z + rotation[2]
	])
	
func size(size = null):
	if size != null:
		if parent():
			size = size.duplicate()
			size[0] /= parent().scale.x
			size[1] /= parent().scale.y
			size[2] /= parent().scale.z
		_self.scale.x = size[0]
		_self.scale.y = size[1]
		_self.scale.z = size[2]

	if parent():
		return [_self.scale.x * parent().scale.x, 
				_self.scale.y * parent().scale.y,
				_self.scale.z * parent().scale.z]
	return [_self.scale.x, _self.scale.y, _self.scale.z]

func scale(scale):
	_self.scale.x *= scale[0]
	_self.scale.y *= scale[1]
	_self.scale.z *= scale[2]
	return [_self.scale.x, _self.scale.y, _self.scale.z]

func gravity(g):
	if "gravity_scale" in _self:
		_self.gravity_scale = g
