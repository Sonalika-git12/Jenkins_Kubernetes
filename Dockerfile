FROM centos/httpd:latest

# Create the /var/www/html directory (if it doesn't exist)
RUN mkdir -p /var/www/html

# Install wget and unzip
RUN yum install -y wget unzip

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
