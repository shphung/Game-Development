extends Control

func _ready():
	$btn_back.connect("pressed", self, "back")
	pass
	
func back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass
