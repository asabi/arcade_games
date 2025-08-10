# 🚗 Combat Tanks - LLM Recreation Prompt

## Game Overview
Combat Tanks is an Atari-style tank battle game featuring destructible terrain, realistic physics, multiplayer combat, and AI opponents with strategic gameplay mechanics.

## 🤖 LLM Prompt for Recreation

```
Create a modern tank combat game called "Combat Tanks" with the following specifications:

## Core Game Mechanics
- 2D tank battle with realistic physics and momentum
- Destructible terrain with crater formation
- Ballistic projectile physics with gravity
- Multiple game modes: Single Player, Versus (2P), Survival
- AI tanks with strategic behavior
- Health system with visual damage indicators

## Physics Engine
- Tank movement with acceleration and friction
- Projectile ballistics: arc trajectory with gravity (0.3 units/frame²)
- Collision detection: Tank-terrain, bullet-terrain, tank-tank
- Explosion-based terrain destruction (25px radius)
- Realistic bouncing and momentum conservation

## Terrain System
- Procedurally generated rolling hills using sine waves
- Base height: Canvas height - 100px with hill variations (±50px)
- Destructible landscape: Explosions remove terrain in circular patterns
- Visual layers: Sky gradient, terrain fill, terrain border
- Collision detection: Pixel-perfect terrain height checking

## Tank Design
- Tank dimensions: 20×15 pixels with separate body and turret
- Body rotation affects movement direction
- Independent turret rotation for aiming
- Tracks visual representation
- Health bar display above tanks when damaged
- Color coding: Player 1 (#32CD32), Player 2 (#FF4444), AI (#8A2BE2)

## Weapon System
- Projectile physics: Initial velocity + gravity simulation
- Bullet trail rendering with opacity fade
- Explosion effects: Visual burst + terrain destruction
- Damage: 25 HP per hit (100 HP total)
- Rate of fire: 500ms cooldown between shots
- Muzzle flash visual effects

## AI Implementation
- **Modes**: Attack, Patrol, Evasive maneuvers
- **Targeting**: Aim calculation with projectile arc prediction
- **Movement**: Terrain navigation and positioning
- **Decision making**: Distance-based behavior switching
- **Difficulty scaling**: Reaction time and accuracy adjustments

## Visual Design
- **Color Palette**: 
  - Background: Dark gradient (#0a0a0a to #1a1a2e to #16213e)
  - Terrain: Green (#228b22) with brown border (#8b4513)
  - Sky: Light blue gradient (#87ceeb to terrain green)
  - Explosions: Orange (#ff6600) to yellow (#ffff00)
- **Effects**: 
  - Particle explosions with physics
  - Muzzle flash animations
  - Screen shake on impact
  - Tank trail rendering

## Input System
- **Player 1**: Arrow keys/WASD (movement), Space/Enter (fire)
- **Player 2**: IJKL (movement), U (fire), Gamepad support
- **Controls**: 
  - Forward/backward: Tank movement in facing direction
  - Left/right: Tank rotation
  - Fire: Launch projectile from turret
- **Touch**: Mobile controls with movement pad and fire button

## Audio Implementation
- **Fire sound**: 1200Hz square wave followed by 800Hz
- **Explosion**: 200Hz sawtooth wave, followed by 150Hz
- **Hit confirmation**: 600Hz triangle wave
- **Engine sound**: 100Hz sawtooth for movement
- Dynamic volume based on action proximity

## Game Modes

### Single Player
- Player vs AI tanks (2-3 AI opponents)
- AI with varying difficulty levels
- Progressive rounds with more opponents

### Versus Mode  
- 2-player competitive combat
- Last tank standing wins
- Shared destructible environment

### Survival Mode
- Player vs unlimited AI waves
- Increasing difficulty over time
- Progressive AI spawn rates and accuracy

## UI/UX Features
- Mode selection with animated cards
- Real-time HUD: Health bars, kill count, round timer
- Tank icons with color coding
- Damage visualization with health bar gradients
- Game over screen with match statistics
- Pause functionality with visual overlay

## Technical Architecture
```javascript
// Core classes structure:
class Tank // Movement, aiming, health, rendering
class Bullet // Ballistic physics, collision, trail effects
class Explosion // Visual effects, terrain destruction, particles
class Terrain // Height mapping, collision detection, destruction
class AITank // Behavior tree, targeting, movement AI
class InputManager // Multi-input device handling
class AudioManager // Web Audio API sound generation
```

## Terrain Generation Algorithm
```javascript
// Rolling hills generation:
for (let x = 0; x < width; x++) {
  const hillHeight = Math.sin(x * 0.01) * 30 + Math.sin(x * 0.005) * 20;
  terrain[x] = baseHeight + hillHeight;
}
```

## Destruction Mechanics
- Circular crater formation around explosion center
- Radius-based terrain removal with distance falloff
- Terrain height recalculation after destruction
- Visual debris particle effects
- Strategic gameplay: Create cover or remove enemy protection

## Visual Effects System
- **Particle engine**: Physics-based debris and sparks
- **Explosions**: Expanding circles with color gradients
- **Muzzle flash**: Temporary bright flash at barrel tip
- **Trails**: Bullet path visualization with fade
- **Screen effects**: Subtle screen shake on explosions

## Performance Optimization
- Efficient collision detection with spatial partitioning
- Canvas optimization: Minimal redraws, object pooling
- 60fps target with requestAnimationFrame
- Memory management for particle systems

## Mobile Compatibility
- Touch controls with movement joystick simulation
- Responsive canvas scaling
- Touch-friendly UI elements
- Swipe gesture support for aiming

## Balancing Parameters
- **Tank speed**: 2 pixels/frame maximum
- **Bullet speed**: 8 pixels/frame initial velocity
- **Gravity**: 0.3 pixels/frame² downward acceleration
- **Health**: 100 HP, 25 damage per hit (4 hits to destroy)
- **Fire rate**: 500ms minimum between shots
- **Explosion radius**: 40px visual, 25px terrain destruction

## Victory Conditions
- **Single/Survival**: All AI tanks destroyed or player death
- **Versus**: First player death determines winner
- **Round system**: Best of multiple rounds option
- **Score tracking**: Kills, accuracy, survival time

Create this as a single HTML file with embedded CSS and JavaScript, featuring realistic tank physics, destructible terrain, and engaging multiplayer combat with AI opponents.
```

## 🎯 Key Implementation Details

### Physics Engine
```javascript
// Tank movement with momentum and friction
// Projectile ballistics with gravity simulation
// Collision detection for all entities
// Terrain deformation from explosions
```

### AI Behavior System
```javascript
// State machine: Idle, Patrol, Attack, Evade
// Target acquisition and tracking
// Pathfinding around terrain obstacles
// Difficulty scaling with reaction times
```

### Terrain Destruction
```javascript
// Real-time terrain modification
// Circular crater generation
// Height map recalculation
// Visual debris particle effects
```

### Multiplayer Architecture
```javascript
// Shared game state between players
// Independent tank instances
// Collision detection between players
// Score tracking and match management
```

## 🎮 Gameplay Features Checklist

- [x] Realistic tank physics with momentum
- [x] Destructible terrain with crater formation
- [x] Ballistic projectile physics
- [x] Multiple game modes (Single, Versus, Survival)
- [x] AI opponents with strategic behavior
- [x] Health system with visual feedback
- [x] Particle effects and explosions
- [x] Audio feedback for all actions
- [x] Touch controls for mobile devices
- [x] Gamepad support for console-style play
- [x] Pause/resume functionality
- [x] Progressive difficulty scaling

## 📱 Control Schemes

### Keyboard Controls
- **Player 1**: Arrow Keys or WASD, Space/Enter (fire)
- **Player 2**: IJKL (movement), U (fire)
- **Shared**: P (Pause), F (Fullscreen), R (Restart)

### Touch Controls
- Movement pad for tank control
- Fire button for shooting
- Mobile-optimized interface

### Gamepad Support
- Left stick for movement
- Face buttons for firing
- Trigger buttons for additional controls

## 🎨 Art Style Guidelines

- **Terrain**: Realistic earth tones with grass texture
- **Sky**: Gradient from light blue to horizon
- **Tanks**: Military green and red with detail sprites
- **Explosions**: Bright orange/yellow with particle effects
- **UI**: Military-inspired HUD with status indicators

## ⚙️ Physics Implementation Strategy

### Movement Physics
- Acceleration and deceleration curves
- Friction coefficients for different terrain
- Tank rotation with realistic turning radius
- Momentum conservation in collisions

### Ballistic Calculations
- Initial velocity vector calculation
- Gravity simulation for realistic arcs
- Collision prediction for AI targeting
- Terrain intersection detection

## 🏆 Scoring and Progression

### Point System
- Tank destruction: Base points + accuracy bonus
- Survival time multiplier
- Streak bonuses for consecutive hits
- Environmental destruction bonuses

### Difficulty Scaling
- AI reaction time improvements
- Increased AI accuracy over rounds
- More AI tanks in survival mode
- Reduced player advantages in higher levels

This prompt provides comprehensive specifications for creating an engaging tank combat game with realistic physics and strategic gameplay elements.
