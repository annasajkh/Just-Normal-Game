extends KinematicBody2D


var velocity = Vector2()
var speed = 250
var gravity = 10
var jump_height = 400
var is_die = false
var is_collide = false
onready var mesh = $MeshInstance2D
onready var die_particle = $DieParticle
onready var trail_particle = $TrailParticle
onready var die_time = $DieTime
onready var collide_sound = $Collide
onready var break_sound = $Break

func _physics_process(_delta):
	if is_on_floor() || is_on_ceiling() || is_on_wall():
		if !is_collide:
			collide_sound.pitch_scale = rand_range(1,3)
			collide_sound.play()
			is_collide = true
	else:
		is_collide = false
	if Input.is_key_pressed(KEY_D):
		velocity.x = speed
	elif Input.is_key_pressed(KEY_A):
		velocity.x = -speed
	else:
		velocity.x = 0
	if Input.is_key_pressed(KEY_SPACE) && is_on_floor():
		velocity.y = -jump_height
	velocity.y+=gravity
	if !is_die:
		velocity = move_and_slide(velocity,Vector2.UP)

func die():
	break_sound.pitch_scale = rand_range(1,2)
	break_sound.play()
	trail_particle.hide()
	die_particle.emitting = true
	mesh.hide()
	die_time.start()
	is_die = true


func _on_DieTime_timeout():
	if get_tree().reload_current_scene() != OK:
		print("ok")


func _on_VisibilityNotifier2D_screen_exited():
	die()
