extends KinematicBody2D

var speed = 100
var object_hit 

var horizontal = 0
var vertical = 1

onready var sprite = $Sprite

func _ready():
	pass

func labels():
	$Label5.set_text(str(position.x))
	$Label6.set_text(str(position.y))

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_pressed("ui_down"):
		sprite.rotation_degrees = 0
		horizontal = 0
		vertical = 1
	if Input.is_action_pressed("ui_left"):
		sprite.rotation_degrees = 90
		horizontal = -1
		vertical = 0
	if Input.is_action_pressed("ui_up"):
		sprite.rotation_degrees = 180
		horizontal = 0
		vertical = -1
	if Input.is_action_pressed("ui_right"):
		sprite.rotation_degrees = 270
		horizontal = 1
		vertical = 0
	
	var sum = sqrt(abs(horizontal) + abs(vertical))
	if sum == 0:
		sum = 1
	
	object_hit = move_and_collide(Vector2(speed * delta * horizontal/sum, speed * delta * vertical/sum))
	
	if object_hit != null:
		object_hit = object_hit.get_collider()
	
	pass