extends CharacterBody3D

const SPEED = 3
const JUMP_VELOCITY = 5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if is_on_floor():
		var random_dir = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()
		var target_pos = global_position + random_dir
		look_at(target_pos, Vector3.UP)
		velocity.x = random_dir.x * SPEED
		velocity.z = random_dir.z * SPEED
		velocity.y = JUMP_VELOCITY
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
