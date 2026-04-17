## Wrapper for method metadata from script reflection
class_name MethodInfo

## Name of the method
var method_name : String
## Method arguments as [PropertyInfo] [Array]
var args : Array
## Default argument values
var default_args : Array
## Method flags (static, virtual, etc.). See [enum MethodFlags]
var flags : int
## Unique method identifier
var id : int
## Return type metadata
var return_type : PropertyInfo

## Constructs MethodInfo from script method reflection data. Usually obtained via [method TypeInfo.get_methods]
func _init(data : Dictionary) -> void:
	method_name = data.name
	args = data.args.map(func(a): return PropertyInfo.new(a))
	default_args = data.default_args
	flags = data.flags
	id = data.id
	return_type = PropertyInfo.new(data.return)

## Returns [code]true[/code] if method is declared with [code]static[/code] keyword
func is_static() -> bool:
	return flags & METHOD_FLAG_STATIC != 0

## Returns [code]true[/code] if method is virtual (overridable)
func is_virtual() -> bool:
	return flags & METHOD_FLAG_VIRTUAL != 0

func _to_string() -> String:
	return '[MethodInfo] "%s", args: %s, default_args: %s, return: %s' % [
		method_name,
		args,
		default_args,
		return_type.type_name
	]
