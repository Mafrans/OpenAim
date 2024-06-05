extends Object
class_name LuaComposeObject

const DEFAULT_PROPS = {
	position = [0, 0, 0],
	rotation = [0, 0, 0],
	size = [1, 1, 1],
	gravity = 1,
}

var _self
func _init(ref):
	self._self = ref

static func apply_props(node, props):
	props = Util.merge(DEFAULT_PROPS, props)
	if not "lua_fields" in node:
		return
	
	for key in props:
		if key not in node.lua_fields(): # for security, only allow props to call lua-safe methods
			continue
		if key in node and node[key] is Callable:
			node[key].call(props[key])


func add_to(parent):
	var obj = _self
	while obj is Callable: # handle no children
		obj = obj.call({})
	
	var node: LuaInstance = obj[0].instantiate()
	parent.add_child(node._self)
	apply_props(node, obj[1])
	
	for c in obj[2]:
		LuaComposeObject.new(c).add_to(node._self)

	return node
