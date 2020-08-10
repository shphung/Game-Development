extends Area2D

var ball_dir = 1

const MOVE_SPEED = 200
const H_MOVE_SPEED = 100
const ROTATION_SPEED = 150

func _process(delta):
	var which = get_name()
	if Input.is_action_pressed(which+"_move_up") and position.y > 16:
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed(which+"_move_down") and position.y < get_viewport_rect().size.y - 18:
		position.y += MOVE_SPEED * delta
	if Input.is_action_pressed("leftPaddle_move_left") and get_parent().get_node("leftPaddle").position.x > 15:
		get_parent().get_node("leftPaddle").position.x -= H_MOVE_SPEED * delta
	if Input.is_action_pressed("leftPaddle_move_right") and get_parent().get_node("leftPaddle").position.x < (get_viewport_rect().size.x/2) - 15:
		get_parent().get_node("leftPaddle").position.x += H_MOVE_SPEED * delta
	if Input.is_action_pressed("rightPaddle_move_left") and get_parent().get_node("rightPaddle").position.x > (get_viewport_rect().size.x/2) + 15:
		get_parent().get_node("rightPaddle").position.x -= H_MOVE_SPEED * delta
	if Input.is_action_pressed("rightPaddle_move_right") and get_parent().get_node("rightPaddle").position.x < (get_viewport_rect().size.x) - 15:
		get_parent().get_node("rightPaddle").position.x += H_MOVE_SPEED * delta
	if Input.is_action_pressed(which+"_rotate_right"):
		if(rotation_degrees <= 60) :
			rotation_degrees += ROTATION_SPEED * delta
	if Input.is_action_pressed(which+"_rotate_left"):
		if(rotation_degrees >= -60) :
			rotation_degrees -= ROTATION_SPEED * delta

func _on_leftPaddle_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.x = -area.direction.x
		if -1 < get_parent().get_node("leftPaddle").rotation_degrees and get_parent().get_node("leftPaddle").rotation_degrees < 1 :
			area.direction = Vector2(area.direction.x, area.direction.y).normalized()
		elif area.direction.x > 0 :
			area.direction = Vector2(area.direction.x, get_parent().get_node("leftPaddle").rotation_degrees * .03).normalized()
		elif area.direction.x < 0 :
			area.direction = Vector2(area.direction.x, -(get_parent().get_node("leftPaddle").rotation_degrees * .03)).normalized()

func _on_rightPaddle_area_entered(area):
	if area.get_name() == "ball":
		get_parent().get_node("pong_sound").play(0.0)
		area.direction.x = -area.direction.x
		if -1 < get_parent().get_node("rightPaddle").rotation_degrees and get_parent().get_node("rightPaddle").rotation_degrees < 1 :
			area.direction = Vector2(area.direction.x, area.direction.y).normalized()
		elif area.direction.x > 0 :
			area.direction = Vector2(area.direction.x, get_parent().get_node("rightPaddle").rotation_degrees * .03).normalized()
		elif area.direction.x < 0 :
			area.direction = Vector2(area.direction.x, -(get_parent().get_node("rightPaddle").rotation_degrees * .03)).normalized()

