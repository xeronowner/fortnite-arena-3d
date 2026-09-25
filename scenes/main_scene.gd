# Main Scene Script - Game Manager
extends Node3D

var player_scene = preload("res://scenes/player/player.tscn")
var player = null

func _ready():
	# Setup scene
	setup_environment()
	spawn_player()
	setup_ui()
	print("Game initialized!")

func setup_environment():
	# Create ground plane
	var ground = MeshInstance3D.new()
	var mesh = PlaneMesh.new()
	mesh.size = Vector2(200, 200)
	ground.mesh = mesh
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.GREEN
	ground.set_surface_override_material(0, material)
	
	var static_body = StaticBody3D.new()
	var collision = CollisionShape3D.new()
	collision.shape = BoxShape3D.new()
	collision.shape.size = Vector3(200, 1, 200)
	static_body.add_child(collision)
	
	ground.add_child(static_body)
	add_child(ground)
	
	# Setup lighting
	var sun = DirectionalLight3D.new()
	sun.rotation.x = -PI / 4
	add_child(sun)
	
	# Setup camera
	var main_camera = Camera3D.new()
	main_camera.position = Vector3(0, 10, 10)
	add_child(main_camera)
	main_camera.make_current()

func spawn_player():
	if not player:
		player = player_scene.instantiate()
		player.position = Vector3(0, 2, 0)
		add_child(player)
		print("Player spawned!")

func setup_ui():
	# TODO: Create HUD with health, shield, ammo, inventory display
	print("UI setup complete!")

func _process(delta):
	# Game loop updates
	pass

func _input(event):
	# Pause menu
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		print("Game paused: ", get_tree().paused)
