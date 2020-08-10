extends Control

func _ready():
	$btn_clone.connect("pressed", self, "pong_clone")
	$btn_variant.connect("pressed", self, "pong_variant")
	$btn_quit.connect("pressed", self, "quit")
	$btn_music.connect("pressed", self, "background_music")
	$btn_credits.connect("pressed", self, "show_credits")
	$btn_instructions.connect("pressed", self, "instructions")
	pass


func pong_clone():
	get_tree().change_scene("res://Scenes/Game/PongClone.tscn")
	pass

func pong_variant():
	get_tree().change_scene("res://Scenes/Game/PongVariant.tscn")
	pass

func background_music():
	if(MusicController.is_playing()):
		MusicController.switch()
		MusicController.stop()
	else :
		MusicController.switch()
		MusicController.play()
	pass
	
func instructions():
	get_tree().change_scene("res://Scenes/Menu/Instructions.tscn")
	
func show_credits():
	get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
	pass
	
func quit():
	get_tree().quit()
	pass
