# Fortnite Arena 3D

A 3D battle royale game inspired by Fortnite and 1v1.lol, built with Godot Engine.

## Features

- **3D Third-Person Combat**: Fast-paced shooting mechanics
- **Building System**: Place walls, ramps, floors, and roofs for defense and mobility
- **Weapon & Loot System**: Find and collect weapons, ammo, and healing items
- **Multiple Game Modes**: Free-for-all, 1v1 arenas, team battles
- **Multiplayer Support**: Play against other players (local and networked)
- **Fully Editable**: Customize everything in the Godot editor

## Getting Started

### Requirements
- Godot Engine 4.x (Download from https://godotengine.org/)
- Git

### Installation

1. Clone this repository:
```bash
git clone https://github.com/xeronowner/fortnite-arena-3d.git
cd fortnite-arena-3d
```

2. Open Godot Engine and import the project:
   - Click "Open Project"
   - Navigate to the cloned folder
   - Click "Open & Edit"

3. The game will load in the editor. Press the **Play** button (▶️) to test!

## Project Structure

```
fortnite-arena-3d/
├── scenes/
│   ├── main_scene.tscn         # Main game scene
│   ├── player/
│   │   ├── player.tscn         # Player character
│   │   └── player.gd           # Player script
│   ├── weapons/
│   │   ├── weapon_base.gd      # Base weapon class
│   │   └── rifle.tscn          # Example rifle
│   ├── building/
│   │   ├── building_system.gd  # Building mechanics
│   │   ├── wall.tscn           # Wall piece
│   │   └── ramp.tscn           # Ramp piece
│   └── ui/
│       ├── hud.tscn            # HUD/UI
│       └── inventory.gd        # Inventory system
├── scripts/
│   ├── game_manager.gd         # Game logic
│   ├── network_manager.gd      # Multiplayer networking
│   └── utils/
│       └── constants.gd        # Game constants
├── assets/
│   ├── models/                 # 3D models
│   ├── textures/               # Textures and materials
│   └── audio/                  # Sound effects and music
└── project.godot               # Project config
```

## Core Mechanics

### 1. Player Movement
- WASD to move
- Space to jump
- Shift to sprint
- Crouch while moving

### 2. Combat System
- Left Click to fire weapon
- Right Click to aim
- Scroll wheel to switch weapons
- Health and shield system

### 3. Building System
- B to enter build mode
- 1-4 to select building pieces (wall, ramp, floor, roof)
- Left Click to place
- Right Click to destroy
- Building pieces have health and can be destroyed

### 4. Inventory
- E to pick up items
- I to open inventory
- Drag to use/drop items

## Editing the Game

### Edit Character Stats
Open `scenes/player/player.gd` and modify:
```gdscript
var max_health = 100
var max_shield = 100
var movement_speed = 7.0
var jump_force = 20.0
```

### Add New Weapons
1. Create a new scene in `scenes/weapons/`
2. Extend `weapon_base.gd`
3. Define firing behavior, damage, ammo count
4. Add to player's weapon inventory

### Customize Building Pieces
Edit `scenes/building/` to change:
- Building piece health
- Placement cost (wood, stone, metal)
- Placement speed
- Visual appearance

### Modify Game Settings
Edit `scripts/constants.gd` to adjust:
- Game duration
- Player counts
- Spawn locations
- Storm mechanics

## Controls

| Key | Action |
|-----|--------|
| WASD | Move |
| Space | Jump |
| Shift | Sprint |
| Ctrl | Crouch |
| Left Mouse | Fire Weapon |
| Right Mouse | Aim |
| Scroll | Switch Weapon |
| B | Enter Build Mode |
| 1-4 | Select Building Piece |
| E | Pick Up Item |
| I | Inventory |
| ESC | Pause Menu |

## Gameplay Loop

1. **Spawn**: Enter the arena
2. **Loot**: Find weapons, ammo, and healing items
3. **Combat**: Engage enemies
4. **Build**: Use building mechanics for defense/mobility
5. **Win**: Be the last player standing

## Multiplayer (Coming Soon)

Network support for playing with others online. Currently supports local multiplayer.

## Contributing

Want to improve the game? 
1. Create a branch: `git checkout -b feature/your-feature`
2. Make changes
3. Commit: `git commit -m "Add feature"`
4. Push: `git push origin feature/your-feature`
5. Open a Pull Request!

## Roadmap

- [ ] Full multiplayer networking
- [ ] Battle royale storm mechanics
- [ ] Cosmetics and skins
- [ ] Battle pass system
- [ ] Cross-platform support
- [ ] Advanced graphics (shadows, reflections)
- [ ] Sound effects and music
- [ ] Tutorials and training mode

## License

MIT License - Feel free to use this for personal or commercial projects!

## Support

Need help? 
- Check the [Godot Documentation](https://docs.godotengine.org/)
- Open an issue on GitHub
- Check existing issues for solutions

---

**Happy Building and Fighting!** 🎮🏗️
