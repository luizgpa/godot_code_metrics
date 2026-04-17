class_name MethodInfo

var method_name : String
var args : Array
var default_args : Array
var flags : int
var id : int
var return_type : PropertyInfo

func _init(data : Dictionary) -> void:
	method_name = data.name
	args = data.args.map(func(a): return PropertyInfo.new(a))
	default_args = data.default_args
	flags = data.flags
	id = data.id
	return_type = PropertyInfo.new(data.return)

func is_static() -> bool:
	return flags & METHOD_FLAG_STATIC != 0

func is_virtual() -> bool:
	return flags & METHOD_FLAG_VIRTUAL != 0

func _to_string() -> String:
	return '[MethodInfo] "%s", args: %s, default_args: %s, return: %s' % [
		method_name,
		args,
		default_args,
		return_type.type_name
	]
