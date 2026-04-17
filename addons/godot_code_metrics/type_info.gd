## Wrapper for class metadata from [ClassDB] or [method ProjectSettings.get_global_class_list]
class_name TypeInfo

## Class name
var type_name : String
## Script language (GDScript, C#, etc.)
var language : String
## File path to the script
var path : String
## Base/parent class name
var base : String
## Class icon resource path
var icon : String
## Whether class can't be instantiated
var is_abstract : bool
## Whether class is a @tool script
var is_tool : bool
## Loaded Script instance
var type_script : Script

## Constructs TypeInfo from ClassDB or ProjectSettings.get_global_class_list() data
func _init(data : Dictionary) -> void:
	type_name = data.class
	language = data.language
	path = data.path
	base = data.base
	icon = data.icon
	is_abstract = data.is_abstract
	is_tool = data.is_tool
	type_script = load(path)

## Retrieves all script-defined properties on this class via [method Script.get_script_property_list]
func get_properties() -> Array[PropertyInfo]:
	var properties : Array[PropertyInfo] = []
	for data in type_script.get_script_property_list():
		properties.append(PropertyInfo.new(data))
	return properties

## Retrieves all script-defined methods on this class via [method Script.get_script_method_list]
func get_methods() -> Array[MethodInfo]:
	var methods : Array[MethodInfo] = []
	for data in type_script.get_script_method_list():
		methods.append(MethodInfo.new(data))
	return methods

func _to_string() -> String:
	return '[TypeInfo] %s (extends %s) at %s' % [type_name, base, path]
