# 🐳 Docker Setup for Arcade Games

This guide explains how to run your arcade games collection using Docker and nginx.

## 🚀 Quick Start

### Using the Script (Recommended)
```bash
# Run on default port 8080
./run-docker.sh

# Run on custom port
./run-docker.sh 3000
./run-docker.sh 9000
```

### Using Docker Directly
```bash
# Build the image
docker build -t arcade-games .

# Run on port 8080
docker run -d --name arcade-games -p 8080:80 --restart unless-stopped arcade-games

# Run on custom port
docker run -d --name arcade-games -p 3000:80 --restart unless-stopped arcade-games
```

## 📋 Prerequisites

- Docker Desktop installed and running

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Your Browser  │───▶│  Docker Port    │───▶│  Nginx:80      │
│                 │    │  (8080, 3000,   │    │                 │
│                 │    │   9000, etc.)   │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🔧 Configuration

### Port Configuration
- **Default Port**: 8080
- **Custom Ports**: Any available port (3000, 9000, etc.)
- **Internal Port**: Always 80 (nginx)

### Environment Variables
```bash
PORT=3000          # External port to expose
NGINX_HOST=localhost
NGINX_PORT=80
```

## 📁 File Structure

```
.
├── Dockerfile              # Docker image definition
├── nginx.conf             # Nginx configuration
├── .dockerignore          # Files to exclude from build
├── run-docker.sh          # Easy startup script
├── stop-docker.sh         # Easy cleanup script
├── index.html             # Main games page
├── games/                 # Game files
└── retro games/           # Retro game files
```

## 🎮 Features

### Nginx Optimizations
- **Gzip Compression**: Faster loading for text files
- **Caching**: Smart caching for static assets
- **Security Headers**: XSS protection, frame options
- **Health Check**: `/health` endpoint for monitoring

### Performance Features
- **Static File Serving**: Optimized for HTML5 games
- **Asset Caching**: CSS, JS, images cached for 1 year
- **Game File Handling**: HTML files served without cache
- **Compression**: Gzip for faster downloads

## 🚀 Usage Examples

### Development
```bash
# Start on port 3000
./run-docker.sh 3000

# View logs
docker logs -f arcade-games

# Stop server
./stop-docker.sh
```

### Production
```bash
# Start on port 80 (requires sudo)
sudo ./run-docker.sh 80

# Or use reverse proxy (recommended)
./run-docker.sh 8080
# Then configure nginx/apache to proxy to :8080
```

### Multiple Instances
```bash
# Instance 1 on port 8080
./run-docker.sh 8080

# Instance 2 on port 8081
./run-docker.sh 8081

# Instance 3 on port 8082
./run-docker.sh 8082
```

## 🔍 Monitoring

### Health Check
```bash
# Check if service is running
curl http://localhost:8080/health

# Should return: "healthy"
```

### Container Status
```bash
# View running containers
docker ps

# View container logs
docker logs -f arcade-games

# View container stats
docker stats arcade-games
```

## 🛠️ Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Check what's using the port
lsof -i :8080

# Kill the process or choose different port
./run-docker.sh 8081
```

#### Container Won't Start
```bash
# Check logs
docker logs arcade-games

# Rebuild image
docker build -t arcade-games .
docker run -d --name arcade-games -p 8080:80 --restart unless-stopped arcade-games
```

#### Permission Issues
```bash
# Make script executable
chmod +x run-docker.sh

# Check Docker permissions
docker info
```

### Debug Mode
```bash
# Run in foreground with logs
docker run --name arcade-games -p 8080:80 arcade-games

# Check nginx configuration
docker exec arcade-games nginx -t
```

## 🔒 Security Features

- **Non-root User**: Container runs as nginx-user (UID 1001)
- **Security Headers**: XSS protection, frame options
- **Resource Limits**: Configurable memory and CPU limits
- **Network Isolation**: Custom bridge network

## 📊 Performance Tuning

### Nginx Settings
- **Worker Connections**: 1024
- **Keepalive Timeout**: 65 seconds
- **Gzip Level**: 6 (balanced compression)
- **Sendfile**: Enabled for efficient file serving

### Docker Settings
- **Health Check**: Every 30 seconds
- **Restart Policy**: Unless stopped
- **Memory**: No limit (adjust as needed)
- **CPU**: No limit (adjust as needed)

## 🔄 Updates

### Rebuilding After Changes
```bash
# Stop container
./stop-docker.sh

# Rebuild and start
docker build -t arcade-games .
./run-docker.sh 8080
```

### Updating Nginx Config
```bash
# Edit nginx.conf
# Rebuild and restart
./stop-docker.sh
docker build -t arcade-games .
./run-docker.sh 8080
```

## 📚 Additional Resources

- [Nginx Documentation](https://nginx.org/en/docs/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

---

**Happy Gaming! 🎮✨**
