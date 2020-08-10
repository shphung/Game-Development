extends Node2D

func _ready():
	$back_btn.connect("pressed", self, "back")
	pass
	
func back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass
