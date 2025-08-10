# Use official nginx image as base
FROM nginx:alpine

# Install any additional packages if needed
RUN apk add --no-cache curl

# Copy the arcade games files to nginx's default serving directory
COPY . /usr/share/nginx/html/

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (will be overridden by docker-compose)
EXPOSE 80

# Start nginx (running as root to avoid permission issues)
CMD ["nginx", "-g", "daemon off;"]
