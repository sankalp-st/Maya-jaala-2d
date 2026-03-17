# Maya Jaala 2D - Game Development Project

## Overview
Maya Jaala 2D is a 2D action combat game built with Godot Engine. Players control a character engaging in hand-to-hand and ranged combat against various enemies using an array of attacks and weapons.

## Features
- **Dynamic Combat System** - Multiple attack types including punches, kicks, and special weapons (spear, wheel blade)
- **Enemy AI** - State-based enemy AI with idle, walking, running, and attacking behaviors
- **Character States** - Comprehensive player state machine handling movement, combat, and death animations
- **Main Menu** - Full menu system for game navigation
- **Audio & Music** - Environmental audio effects and background music
- **Visual Effects** - Particle effects and animations for combat feedback
- **Equipped Items** - Weapon system with spear and wheel blade mechanics
- **Trap System** - Dynamic trap spawner for enemy encounters

## Project Structure

```
maya-jaala-2d/
├── Scenes/                    # Game scenes (menus, fights, characters)
├── Scripts/                   # Game logic
│   ├── Player Script/        # Player state machine and controls
│   ├── enemy1 scripts/       # Enemy AI and behavior states
│   └── items/                # Item/weapon mechanics
├── Assets/                    # Game resources
│   ├── Adventurer/          # Player character sprites
│   ├── Enemy/               # Enemy character sprites
│   ├── audio/               # Sound effects and music
│   ├── Tiles/               # Tileset resources
│   ├── Particles/           # Particle effect assets
│   └── items/               # Item/weapon sprites
└── animations/               # Animation resources
```

## Getting Started

### Requirements
- Godot Engine 4.x
- Compatible with Windows/Linux/macOS

### Installation
1. Clone or download the project
2. Open the project in Godot Engine
3. Run the scene from the main menu (`Main_menu.tscn`)

### Running the Game
- Press F5 or click the Play button in Godot to start the game
- Navigate through the main menu to begin gameplay

## Core Systems

### Player System
- **State Machine** - Manages idle, walking, attacking, and death states
- **Combat Moves** - Single punch, double punch, and kick attacks
- **Health & Progression** - Progress bar tracking system

### Enemy System
- **AI States** - Idle, running, attacking, and death behaviors
- **Combat AI** - Enemies patrol and engage the player
- **State Machine** - Robust state management for enemy behavior

### Weapons
- **Spear** - Melee weapon with range
- **Wheel Blade** - Spinning projectile weapon

## Credits
- **Character Assets** - Adventurer pixel art from various open-source packs
- **Enemy Assets** - Multiple pixel art enemy packs
- **Audio** - Royalty-free sound effects and music
- **Tiles & Props** - PixelFantasy and Gothicvania asset packs
- **Fonts** - Dogica Pixel font

## Development Notes
- Uses Godot's built-in animation system
- State-based architecture for extensibility
- Modular script structure for easy maintenance

## License
This project uses assets from various open-source and free-to-use sources. Please refer to individual asset folders for specific licenses.
