@tool
extends EditorPlugin

func _enter_tree() -> void:
	print("Open Industrial Platform Addon Enabled")

func _exit_tree() -> void:
	print("Open Industrial Platform Addon Disabled")
