#!/bin/bash

# Arcade Games Docker Runner
# Usage: ./run-docker.sh [PORT]

# Default port if none specified
DEFAULT_PORT=8080
PORT=${1:-$DEFAULT_PORT}

echo "🎮 Starting Arcade Games on port $PORT..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

# Check if port is already in use
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "❌ Port $PORT is already in use. Please choose a different port."
    exit 1
fi

# Stop and remove existing container if it exists
if docker ps -a | grep -q "arcade-games"; then
    echo "🔄 Stopping existing container..."
    docker stop arcade-games > /dev/null 2>&1
    docker rm arcade-games > /dev/null 2>&1
fi

# Build the Docker image
echo "🔨 Building Docker image..."
docker build -t arcade-games .

# Run the container
echo "🚀 Starting container on port $PORT..."
docker run -d \
    --name arcade-games \
    -p $PORT:80 \
    --restart unless-stopped \
    arcade-games

# Wait a moment for the container to start
sleep 3

# Check if container is running
if docker ps | grep -q "arcade-games"; then
    echo "✅ Arcade Games is now running!"
    echo "🌐 Open your browser and go to: http://localhost:$PORT"
    echo "🔍 Health check: http://localhost:$PORT/health"
    echo ""
    echo "📋 Container logs: docker logs -f arcade-games"
    echo "🛑 Stop server: docker stop arcade-games"
    echo "🔄 Restart server: docker restart arcade-games"
    echo "🗑️  Remove container: docker rm arcade-games"
else
    echo "❌ Failed to start container. Check logs with: docker logs arcade-games"
    exit 1
fi
