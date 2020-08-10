extends Area2D

var ball_dir = 1

const MOVE_SPEED = 200

func _process(delta):
	var which = get_name()
	if Input.is_action_pressed(which+"_move_up") and position.y > 16:
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed(which+"_move_down") and position.y < get_viewport_rect().size.y - 18:
		position.y += MOVE_SPEED * delta

func _on_leftPaddle_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction = Vector2(ball_dir, randf() * 2 - 1).normalized()

func _on_rightPaddle_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction = Vector2(-ball_dir, randf() * 2 - 1).normalized()
