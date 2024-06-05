extends CharacterBody3D

@onready var Camera = $Camera
@onready var ShootRaycast = $Camera/ShootRaycast

const SENSITIVITY = 1./1000
const MOVE_SPEED = 3

var gravity_scale = 1
var can_move = true
var shoot_speed = 0

func _ready():
	ShootRaycast.enabled = false # Only raycast upon shooting

func _process(delta):
	if Input.is_action_just_pressed("debug_switch_camera"):
		debug_switch_camera()
	if Input.is_action_just_pressed("shoot"):
		shoot()

func debug_switch_camera():
	Camera.current = !Camera.current
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE)
	
func shoot():
	ShootRaycast.force_raycast_update()
	var collider = ShootRaycast.get_collider() as CollisionObject3D
	if collider == null:
		return
		
	var target = collider.find_parent("Target*") as Target
	if target == null:
		return

	target.damage()

func _physics_process(delta):
	var move = Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backward")
	
	if can_move:
		velocity = basis * Vector3(move.x, 0, move.y) * MOVE_SPEED
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		handle_mouse_input(event)

func handle_mouse_input(event: InputEventMouseMotion):
	var yaw = rotation.y
	var pitch = Camera.rotation.x
	yaw -= event.relative.x * SENSITIVITY
	pitch = clamp(pitch - event.relative.y * SENSITIVITY, -PI/2, PI/2)
	rotation.y = yaw
	Camera.rotation.x = pitch
