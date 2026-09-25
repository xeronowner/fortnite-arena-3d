# Game Constants and Settings
extends Node

# Player Settings
const PLAYER_MAX_HEALTH = 100
const PLAYER_MAX_SHIELD = 100
const PLAYER_MOVEMENT_SPEED = 7.0
const PLAYER_SPRINT_SPEED = 12.0
const PLAYER_JUMP_FORCE = 20.0
const PLAYER_FALL_ACCELERATION = 30.0

# Combat Settings
const WEAPON_DAMAGE = 25.0
const WEAPON_FIRE_RATE = 0.1  # seconds between shots
const WEAPON_AMMO_RESERVE = 300
const WEAPON_MAG_SIZE = 30

# Building Settings
const BUILDING_PLACEMENT_RANGE = 10.0
const BUILDING_GRID_SIZE = 1.0
const BUILDING_PIECE_HEALTH = 100
const BUILDING_WOOD_COST = 10
const BUILDING_STONE_COST = 15
const BUILDING_METAL_COST = 20

# Inventory Settings
const MAX_INVENTORY_SLOTS = 5
const HEALING_ITEM_AMOUNT = 25
const SHIELD_POTION_AMOUNT = 25

# Game Settings
const GAME_MAX_PLAYERS = 100
const GAME_DURATION = 1200  # 20 minutes in seconds
const SPAWN_PROTECTION_TIME = 3.0  # seconds

# Map Settings
const MAP_SIZE = 500.0  # World size in units
const STORM_START_TIME = 300.0  # When storm starts in seconds
const STORM_SHRINK_RATE = 1.0  # How fast storm shrinks
const STORM_DAMAGE_PER_SECOND = 5.0

# Camera Settings
const CAMERA_FOV = 75.0
const CAMERA_DISTANCE = 3.0
const CAMERA_HEIGHT = 1.5
const CAMERA_SENSITIVITY = 0.002

# Audio Settings
const MASTER_VOLUME = 1.0
const EFFECT_VOLUME = 0.8
const MUSIC_VOLUME = 0.6

# Debug Settings
const DEBUG_MODE = true
const SHOW_HITBOXES = false
const SHOW_BUILDING_GRID = true
