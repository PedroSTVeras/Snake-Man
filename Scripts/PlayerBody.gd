extends KinematicBody2D

var player

var horizontal = 0
var vertical = 0

var object_hit
var speed

var tile = Vector2()

func _ready():
	player = get_node("../Player")
	speed = player.speed
	pass

func _process(delta):
	horizontal = player.horizontal
	vertical = player.vertical
	
	#Fix player on square
	if horizontal == 0:
		var px = position.x - 30
		position.x = round(px/60) * 60 + 30
	if vertical == 0:
		var py = position.y - 30
		position.y = round(py/60) * 60 + 30
	
	var sum = sqrt(abs(horizontal) + abs(vertical))
	if sum == 0:
		sum = 1
	
	object_hit = move_and_collide(Vector2(speed * delta * horizontal/sum, speed * delta * vertical/sum))
	
	pass
