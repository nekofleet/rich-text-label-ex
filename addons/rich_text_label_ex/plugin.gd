@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type(
		"RichTextLabelEx",
		"RichTextLabel",
		preload("rich_text_label_ex.gd"),
		preload("RichTextLabelEx.svg"))


func _exit_tree():
	remove_custom_type("RichTextLabelEx")
