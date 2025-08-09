# 🟡 Pac-Man Battle - LLM Recreation Prompt

## Game Overview
Pac-Man Battle is a multiplayer implementation of the classic Pac-Man game featuring AI ghosts with distinct behaviors, multiple game modes, and modern visual effects while maintaining authentic arcade gameplay.

## 🤖 LLM Prompt for Recreation

```
Create a modern Pac-Man game called "Pac-Battle" with the following specifications:

## Core Game Mechanics
- Grid-based maze navigation (40x30 grid, 24px cells)
- Collect dots (10 points) and power pellets (50 points)
- Four AI ghosts with unique behaviors and pathfinding
- Power pellet makes ghosts vulnerable for 8 seconds
- Multiple game modes: Classic, Versus (2P), Cooperative (2P)
- Lives system with respawn mechanics
- Level progression with increasing difficulty

## Maze Design
- Pre-defined maze layout with walls, paths, dots, and power pellets
- Tunnel passages on left and right sides for screen wrapping
- Ghost house in center with one-way exit
- Strategic power pellet placement in corners
- Visual representation: walls (#0066ff), dots (#ffcc00), power pellets (white, pulsing)

## Ghost AI System
- **Red Ghost (Blinky)**: Direct pursuit of player
- **Pink Ghost (Pinky)**: Ambush strategy, targets 4 tiles ahead of player
- **Cyan Ghost (Inky)**: Complex targeting based on player direction and red ghost position
- **Orange Ghost (Clyde)**: Alternates between chase and scatter based on distance

- **AI States**: Chase, Scatter, Frightened, Eaten
- **Pathfinding**: A* algorithm or simplified direction-based targeting
- **Mode switching**: Alternates between chase (1000 frames) and scatter (500 frames)
- **Speed**: Slightly slower than player, faster when frightened players

## Visual Design
- Dark blue maze theme (#000011 background)
- Authentic Pac-Man colors: Yellow (#ffff00), Red (#ff0000)
- Ghost colors: Red (#ff0000), Pink (#ffb8ff), Cyan (#00ffff), Orange (#ffb852)
- Frightened ghosts: Blue (#0000ff) with flashing white when time running out
- Animated Pac-Man with opening/closing mouth based on movement direction
- Ghost animations with wavy bottom edge and directional eye movement

## Player Controls
- **Player 1**: Arrow keys or WASD
- **Player 2**: IJKL or gamepad (left stick, D-pad, buttons)
- **Shared**: P (Pause), F (Fullscreen), R (Restart)
- Movement buffering: Queue next direction when current path blocked
- Smooth movement interpolation between grid cells

## Audio Implementation
- **Chomp sound**: 800Hz followed by 600Hz square waves
- **Power pellet**: 200Hz, 300Hz, 400Hz ascending sine waves
- **Ghost eaten**: 1000Hz to 800Hz descending sine waves
- **Death**: Descending sawtooth sequence (8 tones, 800-100Hz)
- **Level complete**: Ascending melody (5 notes, 400-1200Hz)

## Game Modes Implementation

### Classic Mode
- Single player vs AI ghosts
- Traditional scoring and progression
- Ghost AI follows authentic patterns

### Versus Mode
- Two players compete for highest score
- Shared maze and dots
- Both players can eat ghosts during power pellet phase
- Winner determined by final score

### Cooperative Mode
- Two players share lives
- Combined score accumulation
- Team strategy against ghosts

## UI/UX Features
- Mode selection screen with animated cards
- Live HUD: Score, Lives, Level, Bonus points
- Player indicator icons (colored Pac-Man shapes)
- Game over screen with mode-specific statistics
- Pause overlay with controls reminder
- Ready screen countdown before level start

## Technical Architecture
- **Maze representation**: 2D array with cell types (0=path, 1=wall, 2=dot, 3=power pellet, 4=ghost spawn)
- **Collision detection**: Grid-based position checking
- **Pathfinding**: Direction-based movement with target calculation
- **State management**: Game state object with running, paused, mode properties
- **Input handling**: Buffered direction changes with validation

## Visual Effects
- Ghost frightened mode: Blue coloring with white flash warning
- Power pellet: Pulsing glow animation
- Score popups: Animated text for points gained
- Smooth character animations at 60fps
- Maze border glow effects

## Game Progression
- Level completion: All dots collected
- Bonus points: 1000 × level number
- Ghost point values: 200, 400, 800, 1600 (doubles each ghost eaten)
- Speed increase: Gradual increase per level
- Ghost aggression: Reduced scatter time in higher levels

## Mobile Optimization
- Touch controls: Directional swipe or button controls
- Responsive canvas scaling
- Touch event handling for movement
- Adaptive UI for different screen sizes

## Performance Requirements
- 60fps smooth gameplay
- Efficient collision detection
- Optimized rendering with canvas
- Memory management for long play sessions

## Code Structure
```javascript
// Core classes needed:
class Player // Pac-Man movement and rendering
class Ghost // AI behavior and pathfinding  
class Game // State management and game loop
class InputManager // Multi-input handling
class AudioManager // Web Audio API sounds
class Maze // Level layout and collision detection
```

## Maze Layout Requirements
- 40×30 grid with symmetric design
- 4 power pellets in corners
- Central ghost house with proper exits
- Tunnel passages for screen wrapping
- Strategic dot placement for gameplay flow

Create this as a single HTML file with embedded CSS and JavaScript, ensuring authentic Pac-Man gameplay with modern enhancements and cross-platform compatibility.
```

## 🎯 Key Implementation Details

### Ghost AI Behaviors
```javascript
// Each ghost type has unique targeting strategy
// State machine: Chase → Scatter → Frightened → Eaten
// Pathfinding with collision avoidance
// Speed and direction management
```

### Maze Navigation
```javascript
// Grid-based movement with smooth interpolation
// Direction buffering for responsive controls
// Wall collision detection and prevention
// Screen wrapping through tunnel passages
```

### Power Pellet Mechanics
```javascript
// Timer-based frightened mode
// Ghost vulnerability and point multipliers
// Visual state changes and audio feedback
// Mode reversal and speed adjustments
```

### Multiplayer Architecture
```javascript
// Shared maze state between players
// Independent player instances with collision detection
// Score tracking and comparison systems
// Cooperative vs competitive gameplay modes
```

## 🎮 Gameplay Features Checklist

- [x] Authentic maze navigation
- [x] Four distinct AI ghost behaviors
- [x] Multiple game modes (Classic, Versus, Co-op)
- [x] Power pellet mechanics with frightened ghosts
- [x] Smooth grid-based movement
- [x] Audio feedback for all actions
- [x] Level progression system
- [x] Lives and respawn mechanics
- [x] Touch controls for mobile
- [x] Gamepad support
- [x] Pause/resume functionality
- [x] Score tracking and high scores

## 📱 Control Schemes

### Keyboard Controls
- **Player 1**: Arrow Keys or WASD
- **Player 2**: IJKL
- **Shared**: P (Pause), F (Fullscreen), R (Restart)

### Touch Controls
- Directional swipe gestures
- On-screen directional buttons
- Mobile-optimized interface

### Gamepad Support
- Left stick or D-pad for movement
- Face buttons for actions
- Start button for pause

## 🎨 Art Style Guidelines

- **Authentic Colors**: Classic Pac-Man yellow, ghost colors
- **Maze Design**: Blue walls with rounded corners
- **Animations**: Mouth opening/closing, ghost floating
- **Effects**: Power pellet pulsing, frightened ghost flashing
- **UI**: Retro-modern hybrid with neon accents

## 🧠 AI Implementation Strategy

### Ghost Personalities
- **Blinky (Red)**: Aggressive direct pursuer
- **Pinky (Pink)**: Ambush strategist
- **Inky (Cyan)**: Unpredictable pattern-based
- **Clyde (Orange)**: Shy, distance-dependent behavior

### Pathfinding Algorithm
- Target calculation based on ghost type
- Direction priority: Up, Left, Down, Right (never reverse unless frightened)
- Collision avoidance with maze walls
- Mode-switching timers for behavioral changes

This prompt provides complete specifications for recreating an authentic Pac-Man experience with modern multiplayer features.
