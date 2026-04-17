class_name PropertyInfo

var property_name : String
var type_name : String
var type : Variant.Type
var hint : int
var hint_string : String
var usage : int

func _init(data : Dictionary) -> void:
	property_name = data.name
	type_name = data.class_name
	type = data.type
	match type:
		TYPE_NIL: type_name = 'null'
		TYPE_BOOL: type_name = 'bool'
		TYPE_INT: type_name = 'int'
		TYPE_FLOAT: type_name = 'float'
		TYPE_STRING: type_name = 'String'
	hint = data.hint
	hint_string = data.hint_string
	usage = data.usage

func is_script() -> bool:
	return usage & PROPERTY_USAGE_SCRIPT_VARIABLE != 0

func _to_string() -> String:
	return '[PropertyInfo] "%s": %s' % [property_name, type_name]
