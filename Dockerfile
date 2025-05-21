# Use the official Nginx image from Docker 
# This will trigger the build 
#Hello Zeel 
FROM nginx:alpine

# Copy the static website content into the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
