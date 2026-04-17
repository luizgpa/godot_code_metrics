## Wrapper for property metadata from script reflection
class_name PropertyInfo

## Name of the property
var property_name : String
## Type name as string (e.g., "int", "Node")
var type_name : String
## Internal type enum value. See [enum Variant.Type]
var type : Variant.Type
## Property hint for editor (enum, range, etc.). See [enum PropertyHint]
var hint : int
## Hint string for editor customization
var hint_string : String
## Property usage flags (script var, export, etc.). See [enum PropertyUsageFlags]
var usage : int

## Constructs PropertyInfo from script property reflection data. Usually obtained via [method TypeInfo.get_properties]
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

## Returns [code]true[/code] if this is a user-defined script variable
func is_script() -> bool:
	return usage & PROPERTY_USAGE_SCRIPT_VARIABLE != 0

func _to_string() -> String:
	return '[PropertyInfo] "%s": %s' % [property_name, type_name]
