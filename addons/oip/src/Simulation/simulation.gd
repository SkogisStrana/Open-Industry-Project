extends Node

signal started
signal stopped
signal pause_toggled(paused: bool)

var _running: bool = false
var _paused: bool = false

func _ready() -> void:
	if not Engine.is_editor_hint():
		await get_tree().process_frame
		_running = true
		started.emit()

func is_running() -> bool:
	return _running

func is_paused() -> bool:
	return _paused

func start() -> void:
	if _running:
		return
	_running = true
	_paused = false
	started.emit()

func stop() -> void:
	if not _running:
		return
	_running = false
	stopped.emit()

func toggle_pause() -> void:
	_paused = not _paused
	pause_toggled.emit(_paused)
