extends VBoxContainer

## Area will be resized along with this control node
@export var child_area: NodePath
var area: Area2D

func _ready() -> void:
	assert(child_area, "[%s]: The child_area node is not set" % get_path())
	
	area = get_node(child_area)
	resized.connect(_set_scale)
	
	_set_scale()

func _set_scale() -> void:
	area.scale = get_rect().size
	area.position = get_rect().get_center()
