# 🐍 Snake Battle - LLM Recreation Prompt

## Game Overview
Snake Battle is a modern multiplayer implementation of the classic Snake game with power-ups, particle effects, and support for up to 4 players with various input methods.

## 🤖 LLM Prompt for Recreation

```
Create a modern Snake game called "Snake Battle" with the following specifications:

## Core Game Mechanics
- Grid-based movement system (40x30 cells, 20px cell size)
- Snake grows when eating food
- Game over when snake hits walls or itself
- Multiple food types: normal (1 point), super food (5 points), poison (reverses controls)
- Power-ups: speed boost, reversed controls temporarily
- Multiplayer support for 1-4 players

## Visual Design
- Dark space theme (#0a0a0a background)
- Neon colors: Player 1 (#00ff41), Player 2 (#ff0040), Player 3 (#0080ff), Player 4 (#ffff00)
- Particle effects for food consumption and death
- Animated food with pulsing glow effects
- Snake body with gradient transparency (head opaque, tail fading)
- Glowing grid lines for visual clarity

## Input System
- Player 1: Arrow keys or WASD
- Player 2: IJKL keys
- Players 3&4: Gamepad support (axes and D-pad)
- Touch controls for mobile (directional buttons)
- Prevent direct reversal (can't move directly backwards)

## Audio Implementation
- Web Audio API for sound effects
- Eating sound: 800Hz followed by 600Hz square wave
- Death sound: Descending sawtooth waves (5 tones)
- Power-up sound: Ascending sine waves (1200Hz to 1600Hz)
- Movement sound: Brief 400Hz square wave

## UI/UX Features
- Orbitron font for futuristic feel
- Player setup screen with 1-4 player selection
- Live score display with player icons
- Food counter and power-up indicators
- Pause functionality (P key or gamepad Start)
- Game over screen with individual player stats
- Fullscreen support (F key)

## Game Features
- Food spawning: 3 normal food, 20% chance super food, 10% chance poison
- Speed increases every 5 food items eaten
- Power-up duration: Speed boost (5 seconds), Reverse controls (3 seconds)
- Collision detection for all snake segments
- Screen wrapping disabled (walls are deadly)
- Winner determination: last snake alive or highest score

## Technical Requirements
- HTML5 Canvas (800x600 resolution)
- 60fps game loop with requestAnimationFrame
- Modular class structure: Snake, Food, InputManager, AudioManager
- Touch controls for mobile devices
- Responsive design with CSS Grid
- Local storage for high scores

## Visual Effects
- Particle system for death explosions (15 particles)
- Food consumption particles (8 particles)
- Snake head glow effect with shadowBlur
- Animated UI elements with CSS transitions
- Color-coded player panels and health bars

## Game States
- Menu screen with player count selection
- Playing state with live game
- Paused state with overlay
- Game over state with statistics
- Settings for shield regeneration and chain explosions

Create this as a single HTML file with embedded CSS and JavaScript, ensuring cross-browser compatibility and mobile responsiveness.
```

## 🎯 Key Implementation Details

### Snake Movement Logic
```javascript
// Snake moves on grid, direction changes only at valid times
// Body follows head in segments, growth adds new tail segment
// Collision detection checks all body segments and boundaries
```

### Multiplayer Architecture
```javascript
// Each player has independent Snake instance
// Shared food array accessible to all players
// Input manager routes controls to correct player
// Collision detection between different player snakes
```

### Power-up System
```javascript
// Timer-based temporary effects
// Visual indicators for active power-ups
// Different behavior modifications per power-up type
```

### Mobile Optimization
```javascript
// Touch controls with directional buttons
// Responsive canvas scaling
// Touch event prevention for game area
```

## 🎮 Gameplay Features Checklist

- [x] Grid-based movement system
- [x] Multi-player support (1-4 players)
- [x] Multiple food types with different effects
- [x] Power-up system with visual feedback
- [x] Particle effects for visual enhancement
- [x] Audio feedback for all actions
- [x] Touch controls for mobile devices
- [x] Gamepad support for console-style play
- [x] Pause/resume functionality
- [x] Score tracking and winner determination
- [x] Responsive UI design
- [x] Fullscreen mode support

## 📱 Control Schemes

### Keyboard Controls
- **Player 1**: Arrow Keys or WASD
- **Player 2**: IJKL
- **Shared**: P (Pause), F (Fullscreen)

### Touch Controls
- Directional buttons for movement
- Optimized for mobile and tablet devices

### Gamepad Support
- Left stick or D-pad for movement
- Start button for pause
- Automatic gamepad detection

## 🎨 Art Style Guidelines

- **Color Palette**: Neon colors on dark background
- **Typography**: Orbitron font for sci-fi aesthetic
- **Effects**: Glowing elements with CSS shadows and canvas shadowBlur
- **Particles**: Small colored squares with physics-based movement
- **UI**: Translucent panels with neon borders

This prompt provides a comprehensive guide for recreating the Snake Battle game with all its features and visual effects.
