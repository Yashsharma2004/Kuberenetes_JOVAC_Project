FROM centos:7
LABEL maintainer="yashsharma2004.mtr@gmail.com"

# Install dependencies
RUN yum install -y httpd zip unzip curl

# Download oxer.zip with retry mechanism using curl
RUN curl -L --retry 5 --retry-delay 10 https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip -o /var/www/html/oxer.zip || echo "Failed to download oxer.zip"

# Extract the contents of the oxer.zip
WORKDIR /var/www/html/
RUN unzip oxer.zip

# Copy files from oxer folder to current directory
RUN cp -rvf oxer/* .

# Clean up
RUN rm -rf oxer oxer.zip

# Expose HTTP port
EXPOSE 80

# Run Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] 

