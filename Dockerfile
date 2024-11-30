# Use the official HTTPD image based on Alpine Linux (smaller, less dependencies)
FROM httpd:alpine

# Install wget and unzip using the apk package manager (used by Alpine)
RUN apk add --no-cache wget unzip

# Create the /var/www/html directory (if it doesn't exist)
RUN mkdir -p /var/www/html

# Retry downloading the ZIP file up to 3 times
RUN wget --tries=3 --timeout=30 https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip -O /var/www/html/oxer.zip && \
    # Unzip the downloaded file
    unzip /var/www/html/oxer.zip -d /var/www/html/ && \
    # Clean up the ZIP file after extraction
    rm /var/www/html/oxer.zip

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache HTTP Server
CMD ["httpd", "-D", "FOREGROUND"]
