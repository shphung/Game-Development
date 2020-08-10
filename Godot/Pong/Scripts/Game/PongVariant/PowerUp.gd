extends Area2D

var _timer = null

var max_x = 400
var min_x = 200
var max_y = 150
var min_y = 50

var num_of_balls = 1
var new_ball

var powerUps
var powerUpsInPlay = 0

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	pass

func _process(delta):
	powerUpsInPlay = checkPowerUps()
	if powerUpsInPlay == 0 :
		_timer.set_wait_time(1.0)
	elif powerUpsInPlay == 1 :
		_timer.set_wait_time(3.0)
	elif powerUpsInPlay == 2 :
		_timer.set_wait_time(5.0)
	elif powerUpsInPlay == 3 :
		_timer.set_wait_time(7.0)
	elif powerUpsInPlay == 4 :
		_timer.set_wait_time(9.0)
	elif powerUpsInPlay == 5 :
		_timer.set_wait_time(11.0)
	
func _on_Timer_timeout():
	spawnPowerUp()
	pass

func checkPowerUps():
	powerUps = 6
	if get_parent().get_node("speedUp").position == Vector2(-15, -15) :
		powerUps = powerUps - 1
	if get_parent().get_node("speedDown").position == Vector2(-30, -10) :
		powerUps = powerUps - 1
	if get_parent().get_node("multiball").position == Vector2(-10, -30) :
		powerUps = powerUps - 1
	if get_parent().get_node("singleball").position == Vector2(-30, -30) :
		powerUps = powerUps - 1
	if get_parent().get_node("longerBoard").position == Vector2(-10, -50) :
		powerUps = powerUps - 1
	if get_parent().get_node("shorterBoard").position == Vector2(-30, -50) :
		powerUps = powerUps - 1
	return powerUps

func spawnPowerUp():
	randomize()
	var num = randi()%6 + 1
	if num == 1 and get_parent().get_node("speedUp").position == Vector2(-15, -15) :
		get_parent().get_node("speedUp").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	elif num == 2 and get_parent().get_node("speedDown").position == Vector2(-30, -10) :
		get_parent().get_node("speedDown").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	elif num == 3 and num_of_balls == 1 and get_parent().get_node("multiball").position == Vector2(-10, -30) :
		get_parent().get_node("multiball").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	elif num == 4 and num_of_balls == 2 and get_parent().get_node("singleball").position == Vector2(-30, -30) :
		get_parent().get_node("singleball").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	elif num == 5 and get_parent().get_node("longerBoard").position == Vector2(-10, -50) :
		get_parent().get_node("longerBoard").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	elif num == 6 and get_parent().get_node("shorterBoard").position == Vector2(-30, -50) :
		get_parent().get_node("shorterBoard").position = Vector2(get_random_number(max_x, min_x), get_random_number(max_y, min_y))
	pass

func get_random_number(MAX, MIN) :
	randomize()
	var num = randi()%MAX + MIN
	return num


func _on_speedUp_area_entered(area):
	if(area.name == "leftPaddle" or area.name == "rightPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("speedUp").position = Vector2(-15, -15)
		if(get_parent().get_node("ball").speed < 500) :
			var current_Ball_Speed = get_parent().get_node("ball").speed
			current_Ball_Speed += 100
			get_parent().get_node("ball").speed = current_Ball_Speed
			powerUps = powerUps + 1

func _on_speedDown_area_entered(area):
	if(area.name == "leftPaddle" or area.name == "rightPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("speedDown").position = Vector2(-30, -10)
		if(get_parent().get_node("ball").speed > 100) :
			var current_Ball_Speed = get_parent().get_node("ball").speed
			current_Ball_Speed -= 100
			get_parent().get_node("ball").speed = current_Ball_Speed
			powerUps = powerUps + 1


func _on_multiball_area_entered(area):
	if(area.name == "leftPaddle" or area.name == "rightPaddle") :
		num_of_balls = 2
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("multiball").position = Vector2(-10, -30)
		new_ball = get_parent().get_node("ball").duplicate()
		add_child(new_ball)
		powerUps = powerUps + 1


func _on_singleball_area_entered(area):
	if(area.name == "leftPaddle" or area.name == "rightPaddle") :
		num_of_balls = 1
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("singleball").position = Vector2(-30, -30)
		new_ball.queue_free()
		powerUps = powerUps + 1


func _on_longerBoard_area_entered(area):
	if(area.name == "leftPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("longerBoard").position = Vector2(-10, -50)
		if (get_parent().get_node("leftPaddle").scale != Vector2(1, 5)) :
			var current_scale = get_parent().get_node("leftPaddle").scale
			current_scale.y += 1
			var new_scale = Vector2(1, current_scale.y)
			get_parent().get_node("leftPaddle").set_scale(new_scale)
			powerUps = powerUps + 1
	if(area.name == "rightPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("longerBoard").position = Vector2(-10, -50)
		if (get_parent().get_node("rightPaddle").scale != Vector2(1, 5)) :
			var current_scale = get_parent().get_node("rightPaddle").scale
			current_scale.y += 1
			var new_scale = Vector2(1, current_scale.y)
			get_parent().get_node("rightPaddle").set_scale(new_scale)
			powerUps = powerUps + 1


func _on_shorterBoard_area_entered(area):
	if(area.name == "leftPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("shorterBoard").position = Vector2(-30, -50)
		if (get_parent().get_node("leftPaddle").scale != Vector2(1, 1)) :
			var current_scale = get_parent().get_node("leftPaddle").scale
			current_scale.y -= 1
			var new_scale = Vector2(1, current_scale.y)
			get_parent().get_node("leftPaddle").set_scale(new_scale)
			powerUps = powerUps + 1
	if(area.name == "rightPaddle") :
		get_parent().get_node("power_up_sound").play(0.0)
		get_parent().get_node("shorterBoard").position = Vector2(-30, -50)
		if (get_parent().get_node("rightPaddle").scale != Vector2(1, 1)) :
			var current_scale = get_parent().get_node("rightPaddle").scale
			current_scale.y -= 1
			var new_scale = Vector2(1, current_scale.y)
			get_parent().get_node("rightPaddle").set_scale(new_scale)
			powerUps = powerUps + 1
