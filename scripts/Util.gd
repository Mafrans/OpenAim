extends Object
class_name Util

static func merge(obj = {}, other = {}):
	obj = obj.duplicate()
	for key in other:
		obj[key] = other[key]
	return obj
