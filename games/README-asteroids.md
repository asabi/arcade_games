# 🚀 Asteroids - LLM Recreation Prompt

## Game Overview
Asteroids is a classic space combat game featuring ship rotation mechanics, momentum-based physics, asteroid splitting, and multiplayer combat with modern visual effects and multiple game modes.

## 🤖 LLM Prompt for Recreation

```
Create a modern Asteroids game called "Neon Asteroids" with the following specifications:

## Core Game Mechanics
- Vector-based ship movement with momentum physics
- 360-degree rotation with inertial movement
- Asteroid destruction with progressive splitting (3 size levels)
- Hyperspace teleportation with cooldown system
- UFO enemies with AI targeting
- Screen wrapping for all objects
- Lives system with invulnerability periods

## Ship Physics Engine
- **Movement**: Thrust-based acceleration with momentum conservation
- **Rotation**: Smooth angular velocity (0.15 radians/frame)
- **Friction**: Gradual velocity decay (0.98 multiplier per frame)
- **Max Speed**: 8 units/frame speed limit
- **Thrust**: 0.3 units/frame² acceleration
- **Inertia**: Ships coast when not thrusting
- **Screen Wrap**: Seamless transition across boundaries

## Asteroid System
- **Sizes**: Large (40px), Medium (25px), Small (15px)
- **Splitting**: Large→2-3 Medium, Medium→2-3 Small, Small→destroyed
- **Movement**: Constant velocity with rotation
- **Shape Generation**: Procedural irregular polygons (8-12 vertices)
- **Physics**: Independent velocity vectors, collision detection
- **Scoring**: Large (20 pts), Medium (50 pts), Small (100 pts)

## Weapon System
- **Bullets**: Fast-moving projectiles (10 units/frame)
- **Lifetime**: 60 frames before auto-destruction
- **Fire Rate**: 10-frame cooldown between shots
- **Physics**: Inherit partial ship velocity + bullet velocity
- **Visual**: Trail rendering with fade effect
- **Screen Wrap**: Bullets wrap around screen edges

## Visual Design
- **Theme**: Neon space aesthetic with particle effects
- **Ship**: Triangular vector design with thruster flames
- **Colors**:
  - Ship: Cyan (#00ffff) with blue thrusters (#0080ff)
  - Bullets: Yellow (#ffff00) with glow trails
  - Asteroids: Orange (#ff6600) with subtle fill
  - Background: Deep space (#000011) with star field
  - Explosions: White (#ffffff) expanding circles
- **Effects**:
  - Particle explosions on destruction
  - Ship trail rendering during movement
  - Thruster flame animation
  - Hyperspace warp effect

## Input System
- **Player 1**: Arrow keys or WASD
  - Up/W: Thrust forward
  - Left/A, Right/D: Rotate ship
  - Space: Fire weapons
  - Shift: Hyperspace teleport
- **Player 2**: IJKL + gamepad
  - I: Thrust, J/L: Rotate, K: Fire, U: Hyperspace
  - Gamepad: Left stick movement, face buttons for actions
- **Touch Controls**: Virtual joystick and action buttons for mobile

## Audio Implementation
- **Thrust**: 100Hz sawtooth wave (engine sound)
- **Fire**: 1000Hz square wave (0.1s)
- **Explosion**: 150Hz sawtooth with decay (0.3s)
- **Asteroid Hit**: 440Hz triangle wave (0.15s)
- **Hyperspace**: Descending frequency sweep (2000-200Hz)
- **UFO**: 820Hz triangle wave (continuous while visible)

## Game Modes

### Classic Mode
- Single player vs asteroids
- Progressive difficulty with wave completion
- UFO spawns at random intervals
- Traditional scoring system

### Versus Mode  
- 2-player competitive combat
- Shared asteroid field
- Player vs player combat allowed
- Score competition for asteroid destruction

### Cooperative Mode
- 2-player team survival
- Shared lives pool
- Combined score accumulation
- Mutual protection gameplay

### Endless Mode
- Infinite wave generation
- Power-ups and special weapons
- Escalating difficulty curve
- Leaderboard scoring

## Hyperspace Mechanics
- **Cooldown**: 180 frames (3 seconds at 60fps)
- **Effect**: Random teleportation across screen
- **Invulnerability**: 60 frames after teleport
- **Risk**: 5% chance of self-destruction
- **Visual**: Screen warp effect and particle burst

## AI Systems
- **UFO Behavior**: 
  - Spawn probability: 2% per second after 14 seconds
  - Movement: Constant horizontal velocity
  - Targeting: Aims at player position with lead calculation
  - Fire Rate: 2% chance per frame when player visible
  - Score Value: 500-1500 points (random)

## Physics Implementation
```javascript
// Ship movement with momentum:
if (thrust) {
  ship.vx += Math.cos(ship.angle) * SHIP_THRUST;
  ship.vy += Math.sin(ship.angle) * SHIP_THRUST;
}
ship.vx *= SHIP_FRICTION;
ship.vy *= SHIP_FRICTION;
ship.x += ship.vx;
ship.y += ship.vy;
```

## Visual Effects System
- **Explosion Particles**: 
  - 15 particles per explosion
  - Physics-based movement with decay
  - Color variation and size scaling
- **Ship Trail**:
  - 5-point history with opacity fade
  - Only visible during thrust
- **Hyperspace Effect**:
  - Screen-wide concentric circles
  - Fade animation over 0.5 seconds

## Collision Detection
- **Ship vs Asteroids**: Radius-based with size consideration
- **Bullets vs Asteroids**: Point-to-circle collision
- **Ship vs Ship**: Player combat in versus mode
- **Boundary Wrapping**: Mathematical modulo operations

## Scoring System
- **Asteroid Destruction**: Size-based point values with multiplier
- **UFO Destruction**: Bonus points (500-1500)
- **Multiplier System**: Consecutive hits increase multiplier (max 8x)
- **Wave Bonus**: 1000 × wave number
- **Life Bonus**: 10,000 points = extra life

## UI/UX Features
- **HUD**: Score, Lives, Wave, High Score, Multiplier, Asteroid Count
- **Lives Display**: Ship icon representations
- **Radar**: Mini-map showing object positions
- **Game Over**: Statistics with high score comparison
- **Pause**: Overlay with control reminders

## Technical Architecture
```javascript
// Core classes structure:
class Ship // Physics, rotation, rendering, input handling
class Asteroid // Movement, splitting, collision, shape generation
class Bullet // Ballistics, lifetime, trail effects
class Particle // Visual effects, physics simulation
class UFO // AI behavior, targeting, movement patterns
class InputManager // Multi-device input abstraction
class AudioManager // Web Audio API sound generation
```

## Performance Optimization
- **Object Pooling**: Reuse bullet and particle objects
- **Efficient Rendering**: Canvas optimization techniques
- **Collision Optimization**: Spatial partitioning for large object counts
- **60fps Target**: Consistent frame timing with requestAnimationFrame

## Mobile Compatibility
- **Touch Controls**: Virtual joystick for movement, buttons for actions
- **Responsive Design**: Canvas scaling for different screen ratios
- **Performance**: Reduced particle counts on mobile devices
- **Touch Gestures**: Swipe for hyperspace, tap for fire

## Wave Progression
- **Initial Asteroids**: 4 large asteroids
- **Wave Scaling**: +1 asteroid every 2 waves
- **Speed Increase**: Gradual velocity increases
- **UFO Frequency**: More frequent spawns in later waves

## Multiplayer Features
- **Shared Physics**: Common game world state
- **Independent Lives**: Separate life pools per player
- **Collision Handling**: Player vs player combat options
- **Score Tracking**: Individual and combined scoring modes

## Visual Polish
- **Star Field**: Animated background with twinkling effects
- **Screen Borders**: Neon glow boundary indicators
- **Ship Glow**: Subtle luminescence on all objects
- **Smooth Animation**: 60fps interpolation for all movement

Create this as a single HTML file with embedded CSS and JavaScript, featuring authentic vector-based Asteroids gameplay with modern visual enhancements, multiple game modes, and cross-platform compatibility.
```

## 🎯 Key Implementation Details

### Vector Physics
```javascript
// Momentum-based movement with thrust acceleration
// Angular velocity for smooth rotation
// Friction simulation for realistic space physics
// Screen wrapping with seamless transitions
```

### Asteroid Mechanics
```javascript
// Procedural shape generation with random vertices
// Splitting algorithm creating smaller fragments
// Collision detection with radius-based calculations
// Independent rotation and movement for each asteroid
```

### Hyperspace System
```javascript
// Random teleportation with boundary checking
// Cooldown timer to prevent abuse
// Visual effect synchronization
// Risk/reward mechanics with destruction chance
```

### Multiplayer Architecture
```javascript
// Shared game state with independent player instances
// Collision detection between players and objects
// Input routing for multiple control schemes
// Score and life management per player
```

## 🎮 Gameplay Features Checklist

- [x] Momentum-based ship physics
- [x] 360-degree rotation controls
- [x] Asteroid splitting mechanics (3 size levels)
- [x] Hyperspace teleportation with cooldown
- [x] Multiple game modes (Classic, Versus, Co-op, Endless)
- [x] UFO enemies with AI targeting
- [x] Particle effects for explosions
- [x] Audio feedback for all actions
- [x] Touch controls for mobile devices
- [x] Gamepad support for console-style play
- [x] Screen wrapping for all objects
- [x] Lives system with invulnerability

## 📱 Control Schemes

### Desktop Controls
- **Player 1**: Arrow Keys or WASD, Space (fire), Shift (hyperspace)
- **Player 2**: IJKL, K (fire), U (hyperspace)
- **Shared**: P (Pause), F (Fullscreen), R (Restart)

### Mobile Controls
- **Virtual Joystick**: Touch-based ship movement
- **Action Buttons**: Fire and hyperspace buttons
- **Responsive**: Adapts to different screen sizes

### Gamepad Support
- **Left Stick**: Ship rotation and thrust
- **Face Buttons**: Fire and hyperspace
- **Start Button**: Pause functionality

## 🎨 Art Style Guidelines

- **Vector Graphics**: Clean geometric shapes with neon outlines
- **Color Palette**: Bright neon colors on deep space background
- **Effects**: Glowing trails, particle explosions, screen effects
- **Typography**: Futuristic font for HUD elements
- **Animation**: Smooth 60fps movement with physics-based effects

## ⚙️ Physics Implementation Strategy

### Ship Movement
- Thrust vector addition to velocity
- Momentum conservation with gradual decay
- Angular rotation with smooth acceleration
- Maximum velocity limiting for gameplay balance

### Collision System
- Circle-based collision detection for performance
- Accurate boundary calculations
- Explosion triggers with particle generation
- Score calculation and multiplier management

## 🌟 Advanced Features

### Visual Effects
- **Particle Systems**: Physics-based debris and sparks
- **Trail Rendering**: Historical position tracking with fade
- **Screen Effects**: Hyperspace warp distortion
- **Glow Effects**: Neon aesthetic with canvas shadowBlur

### AI Behavior
- **UFO Targeting**: Predictive aim calculation
- **Spawn Management**: Time-based appearance system
- **Difficulty Scaling**: Progressive challenge increases
- **Player Tracking**: Smart positioning and firing patterns

This prompt provides comprehensive specifications for recreating the classic Asteroids experience with modern enhancements and multiplayer capabilities.
