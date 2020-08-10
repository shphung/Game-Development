extends Area2D

func _on_ceiling_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.y = -area.direction.y

func _on_floor_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.y = -area.direction.y
