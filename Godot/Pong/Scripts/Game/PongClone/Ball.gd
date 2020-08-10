extends Area2D

const BALL_SPEED = 200
var ball_direction = -1
var direction = Vector2(ball_direction, 0)
var speed = BALL_SPEED

onready var initial_pos = self.position

func reset():
	position = initial_pos
	speed = BALL_SPEED
	if ball_direction == -1 :
		ball_direction = 1
	elif ball_direction == 1 :
		ball_direction = -1
	direction = Vector2(ball_direction, randf() * 2 - 1).normalized()

func _process(delta):
	position += direction * speed * delta
