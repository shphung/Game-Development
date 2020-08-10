extends Area2D

var leftScore = 0
var rightScore = 0

func _on_leftWall_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		rightScore += 1
		var label = get_parent().get_node("rightPlayer/Score")
		label.text = str(rightScore)
		area.reset()
		
func _on_rightWall_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		leftScore += 1
		var label = get_parent().get_node("leftPlayer/Score")
		label.text = str(leftScore)
		area.reset()
