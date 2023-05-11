@tool
@icon("RichTextLabelEx.svg")
class_name RichTextLabelEx
extends RichTextLabel
## A custom node of [RichTextLabel] for external images in BBCode tags.
##
## [codeblock]
## [img]user://user_path.png[/img]
## [img]E:/absolute_path.png[/img]
## [img]relative_path.png[/img]
## [/codeblock][br]
## [b]Note:[/b] See also [member bbcode_enabled_deferred].
##
## @tutorial: https://github.com/nekofleet/rich-text-label-ex


## If you turn on [member RichTextLabel.bbcode_enabled] in editor,
## turn on [member bbcode_enabled_deferred] instead.[br]
## [b]Note:[/b] But you don't need to use [member bbcode_enabled_deferred] in your script.
@export var bbcode_enabled_deferred := false

var _texture_caches := {} # {"path": Texture2D}


func _set(property: StringName, value: Variant) -> bool:
	match property:
		"text":
			_set_texture_caches(value)
	return false


func _ready() -> void:
	_set_texture_caches(text)

	if not Engine.is_editor_hint():
		if bbcode_enabled_deferred:
			bbcode_enabled = true
			bbcode_enabled_deferred = false


## Creates a new texture from the path of imported image or external image.
## [codeblock]
## # load() - imported image only
## $Sprite2D.texture = load("res://imported_image.png")
## $Sprite2D.texture = load("external_image.png") # error
##
## # this method
## $Sprite2D.texture = RichTextLabelEx.load_texture_from_file("res://imported_image.png")
## $Sprite2D.texture = RichTextLabelEx.load_texture_from_file("external_image.png")
##
## # load() after this method
## var texture = RichTextLabelEx.load_texture_from_file("external_image.png")
## $Sprite2D.texture = load("external_image.png")
## [/codeblock]
static func load_texture_from_file(path: String) -> Texture2D:
	if path.begins_with("res://"):
		return load(path)

	var image = Image.load_from_file(path)
	if image != null:
		var texture = ImageTexture.create_from_image(image)
		if texture != null:
			if path.is_relative_path():
				path = "res://" + path
			texture.take_over_path(path)
			return texture

	return null


func _set_texture_caches(new_text: String) -> void:
	# Get image paths from new_text.
	var new_paths = []

	var re = RegEx.new()
	re.compile("\\[img.*\\](?P<path>.*)\\[\\/img\\]")

	var re_matches = re.search_all(new_text)
	for re_match in re_matches:
		var path = re_match.get_string("path")
		if not path.begins_with("res://"):
			new_paths.append(path)

	# Remove unused caches.
	var old_paths = _texture_caches.keys()
	for old_path in old_paths:
		if old_path not in new_paths:
			_texture_caches.erase(old_path)

	# Add new caches.
	for new_path in new_paths:
		if new_path not in old_paths:
			_texture_caches[new_path] = RichTextLabelEx.load_texture_from_file(new_path)
