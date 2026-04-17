class_name TypeInfo

var type_name : String
var language : String
var path : String
var base : String
var icon : String
var is_abstract : bool
var is_tool : bool
var type_script : Script

func _init(data : Dictionary) -> void:
	type_name = data.class
	language = data.language
	path = data.path
	base = data.base
	icon = data.icon
	is_abstract = data.is_abstract
	is_tool = data.is_tool
	type_script = load(path)

func get_properties() -> Array[PropertyInfo]:
	var properties : Array[PropertyInfo] = []
	for data in type_script.get_script_property_list():
		properties.append(PropertyInfo.new(data))
	return properties

func get_methods() -> Array[MethodInfo]:
	var methods : Array[MethodInfo] = []
	for data in type_script.get_script_method_list():
		methods.append(MethodInfo.new(data))
	return methods

func _to_string() -> String:
	return '[TypeInfo] %s (extends %s) at %s' % [type_name, base, path]
