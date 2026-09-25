# Player Script - Handles player movement, combat, and building
extends CharacterBody3D

# Movement
var move_speed = Constants.PLAYER_MOVEMENT_SPEED
var sprint_speed = Constants.PLAYER_SPRINT_SPEED
var jump_force = Constants.PLAYER_JUMP_FORCE
var gravity = Constants.PLAYER_FALL_ACCELERATION
var is_sprinting = false

# Health & Shield
var health = Constants.PLAYER_MAX_HEALTH
var shield = Constants.PLAYER_MAX_SHIELD
var max_health = Constants.PLAYER_MAX_HEALTH
var max_shield = Constants.PLAYER_MAX_SHIELD

# Combat
var current_weapon = null
var weapon_damage = Constants.WEAPON_DAMAGE
var can_shoot = true
var shoot_cooldown = Constants.WEAPON_FIRE_RATE

# Building
var is_building = false
var building_range = Constants.BUILDING_PLACEMENT_RANGE
var selected_building_piece = 0  # 0=wall, 1=ramp, 2=floor, 3=roof

# Inventory
var inventory = []
var ammo = Constants.WEAPON_AMMO_RESERVE

# References
@onready var camera = $Camera3D
@onready var raycast = $Camera3D/RayCast3D

func _ready():
	# Initialize player
	velocity = Vector3.ZERO
	
	if not camera:
		camera = Camera3D.new()
		add_child(camera)
	
	# Create raycast for shooting
	if not raycast:
		raycast = RayCast3D.new()
		camera.add_child(raycast)

func _physics_process(delta):
	# Handle input
	handle_movement_input()
	handle_building_input()
	handle_combat_input()
	
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Move player
	velocity = move_and_slide(velocity)
	
	# Update HUD
	update_hud()

func handle_movement_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Sprinting
	is_sprinting = Input.is_action_pressed("ui_shift")
	var current_speed = sprint_speed if is_sprinting else move_speed
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
	
	# Jumping
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
	
	# Crouching
	if Input.is_action_pressed("ui_crouch"):
		move_speed = Constants.PLAYER_MOVEMENT_SPEED * 0.5

func handle_building_input():
	# Toggle building mode
	if Input.is_action_just_pressed("ui_build"):
		is_building = !is_building
		print("Building mode: ", is_building)
	
	# Select building piece
	if Input.is_action_just_pressed("ui_build_wall"):
		selected_building_piece = 0
	elif Input.is_action_just_pressed("ui_build_ramp"):
		selected_building_piece = 1
	elif Input.is_action_just_pressed("ui_build_floor"):
		selected_building_piece = 2
	elif Input.is_action_just_pressed("ui_build_roof"):
		selected_building_piece = 3
	
	# Place building piece
	if is_building and Input.is_action_just_pressed("ui_place_building"):
		place_building_piece()

func handle_combat_input():
	# Fire weapon
	if Input.is_action_pressed("ui_shoot") and can_shoot and ammo > 0:
		shoot()
		can_shoot = false
		await get_tree().create_timer(shoot_cooldown).timeout
		can_shoot = true
	
	# Aim
	if Input.is_action_pressed("ui_aim"):
		camera.fov = 50  # Zoom in
	else:
		camera.fov = Constants.CAMERA_FOV
	
	# Switch weapon
	if Input.is_action_just_pressed("ui_scroll_up"):
		ammo += 30  # Add ammo for testing
	elif Input.is_action_just_pressed("ui_scroll_down"):
		ammo = max(0, ammo - 30)

func shoot():
	# Raycasting for hit detection
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		
		# Hit enemy
		if collider.is_in_group("enemies"):
			collider.take_damage(weapon_damage)
			print("Hit enemy! Damage: ", weapon_damage)
		
		# Hit building
		elif collider.is_in_group("buildings"):
			collider.take_damage(weapon_damage)
			print("Hit building! Damage: ", weapon_damage)
	
	ammo -= 1
	print("Shot fired! Ammo: ", ammo)
	
	# TODO: Add muzzle flash, sound effects, etc.

func place_building_piece():
	# Get building piece name
	var piece_names = ["wall", "ramp", "floor", "roof"]
	var piece_name = piece_names[selected_building_piece]
	
	# TODO: Instantiate building piece at raycast hit position
	print("Placing ", piece_name)

func take_damage(damage):
	# Damage shield first, then health
	if shield > 0:
		shield -= damage
		if shield < 0:
			health += shield  # Overflow to health
			shield = 0
	else:
		health -= damage
	
	print("Player took damage! Health: ", health, " Shield: ", shield)
	
	if health <= 0:
		die()

func heal(amount):
	health = min(health + amount, max_health)
	print("Player healed! Health: ", health)

func shield_recharge(amount):
	shield = min(shield + amount, max_shield)
	print("Shield recharged! Shield: ", shield)

func die():
	print("Player died!")
	queue_free()

func update_hud():
	# TODO: Update UI with health, shield, ammo, etc.
	pass
