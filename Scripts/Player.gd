extends KinematicBody2D

var speed = 250
var object_hit 

var horizontal = 0
var vertical = 1

var tile = Vector2()

onready var sprite = $Sprite

func _ready():
	pass

func labels():
	#$Labels/Label.set_text(str(position.x))
	#$Labels/Label2.set_text(str(position.y))
	$Labels/Label.set_text(str(tile.x))
	$Labels/Label2.set_text(str(tile.y))

func _process(delta):
	#labels
	labels()
	
	#Quit
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	#Movement
	if Input.is_action_pressed("ui_down"):
		sprite.rotation_degrees = 0
		horizontal = 0
		vertical = 1
	if Input.is_action_pressed("ui_up"):
		sprite.rotation_degrees = 180
		horizontal = 0
		vertical = -1
	if Input.is_action_pressed("ui_left"):
		sprite.rotation_degrees = 90
		horizontal = -1
		vertical = 0
	if Input.is_action_pressed("ui_right"):
		sprite.rotation_degrees = 270
		horizontal = 1
		vertical = 0
	
	#Fix player on tile
	if horizontal == 0:
		tile.x = position.x - 30
		tile.x = round(tile.x/60)
		position.x = tile.x * 60 + 30
	if vertical == 0:
		tile.y = position.y - 30
		tile.y = round(tile.y/60)
		position.y = tile.y * 60 + 30
	
	#IDK
	var sum = sqrt(abs(horizontal) + abs(vertical))
	if sum == 0:
		sum = 1
	
	#Move Player and collide
	object_hit = move_and_collide(Vector2(speed * delta * horizontal/sum, speed * delta * vertical/sum))
	
	#Get object that collided 
	if object_hit != null:
		object_hit = object_hit.get_collider()
	
	pass