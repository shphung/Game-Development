extends Area2D

var leftScore = 0
var rightScore = 0

func updateRightScore():
	var label = get_parent().get_node("rightPlayer/Score")
	rightScore = label.text
	rightScore = int(rightScore) + 1
	label.text = str(rightScore)

func updateLeftScore():
	var label2 = get_parent().get_node("leftPlayer/Score")
	leftScore = label2.text
	leftScore = int(leftScore) + 1
	label2.text = str(leftScore)

func _on_leftWall_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateRightScore()
		area.reset()
		
func _on_ceilingLeftHit_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateRightScore()
		area.reset()

func _on_floorLeftHit_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateRightScore()
		area.reset()

func _on_rightWall_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateLeftScore()
		area.reset()

func _on_ceilingRightHit_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateLeftScore()
		area.reset()

func _on_floorRightHit_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("missed_sound").play(0.0)
		updateLeftScore()
		area.reset()

func _on_leftWallMiss_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.x = -area.direction.x

func _on_rightWallMiss_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.x = -area.direction.x

func _on_ceiling_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.y = -area.direction.y

func _on_floor_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.y = -area.direction.y
