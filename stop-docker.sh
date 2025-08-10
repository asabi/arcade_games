#!/bin/bash

# Arcade Games Docker Stopper

echo "🛑 Stopping Arcade Games..."

# Check if container exists and is running
if docker ps | grep -q "arcade-games"; then
    echo "🔄 Stopping container..."
    docker stop arcade-games
    echo "✅ Container stopped."
elif docker ps -a | grep -q "arcade-games"; then
    echo "ℹ️  Container exists but is not running."
else
    echo "ℹ️  No arcade-games container found."
fi

# Remove container if it exists
if docker ps -a | grep -q "arcade-games"; then
    echo "🗑️  Removing container..."
    docker rm arcade-games
    echo "✅ Container removed."
else
    echo "ℹ️  No container to remove."
fi

echo "🎮 Arcade Games has been stopped and cleaned up."
