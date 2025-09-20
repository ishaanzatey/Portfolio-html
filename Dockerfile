# Use the official nginx image as base
FROM nginx:alpine

# Install locales and UTF-8 support for Alpine
RUN apk add --no-cache musl-locales

# Set UTF-8 as default locale (use C.UTF-8 for Alpine)
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy the HTML file and assets
COPY nnn.html index.html
COPY images/ ./images/
COPY assets/ ./assets/

# Copy a custom nginx configuration for better performance
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]