extends KinematicBody2D

var player

var horizontal = 0
var vertical = 0

var object_hit
var speed

var tile = Vector2()

export (NodePath) var playerpath

func _ready():
	player = get_node(playerpath)
	speed = player.speed
	horizontal = player.horizontal
	vertical = player.vertical
	tile = player.tile
	tile.y -= 1
	pass

func labels():
	$Labels/Label.set_text(str(tile.x))
	$Labels/Label2.set_text(str(tile.y))

func _process(delta):
	
	labels()
	
	
	#Fix player on square
	#if horizontal == 0:
	#	var px = position.x - 30
	#	position.x = round(px/60) * 60 + 30
	#if vertical == 0:
	#	var py = position.y - 30
	#	position.y = round(py/60) * 60 + 30
	
	#position.x = tile.x * 60 + 30
	#position.y = tile.y * 60 + 30
	
	#Find current tile
	tile.x = position.x - 30
	tile.x = round(tile.x/60)
	tile.y = position.y - 30
	tile.y = round(tile.y/60)
	
	if horizontal != player.horizontal:
		if tile.y == player.tile.y && tile.x != player.tile.x:
			horizontal = player.horizontal
			vertical = player.vertical
	if vertical != player.vertical:
		if tile.x == player.tile.x && tile.y != player.tile.y:
			horizontal = player.horizontal
			vertical = player.vertical
	
	#Fix player on tile
	if horizontal == 0:
		position.x = tile.x * 60 + 30
	if vertical == 0:
		position.y = tile.y * 60 + 30
	
	var sum = sqrt(abs(horizontal) + abs(vertical))
	if sum == 0:
		sum = 1
	
	object_hit = move_and_collide(Vector2(speed * delta * horizontal/sum, speed * delta * vertical/sum))
	
	pass
