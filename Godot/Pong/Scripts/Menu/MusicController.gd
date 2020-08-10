extends Control

onready var _player = $AudioStreamPlayer
var forcedStop = false

func play():
	stop()
	_player.play()
	pass

func stop():
	_player.stop()
	pass

func is_playing():
	if(_player.is_playing()) :
		return true
	else :
		return false

func switch():
	if forcedStop == false :
		forcedStop = true
	else :
		forcedStop = false

func _on_AudioStreamPlayer_finished():
	if(not _player.is_playing() and forcedStop == false) :
		stop()
		_player.play()
	elif(forcedStop == true) :
		_player.stop()
