# Use the official nginx image as base
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy the HTML file and assets
COPY new_features_portfolio.html index.html
COPY images/ ./images/
COPY assets/ ./assets/

# Copy a custom nginx configuration for better performance
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
