# Use CentOS 7 as the base image
FROM centos:7

# Maintainer information
LABEL maintainer="yashsharma2004.mtr@gmail.com"

# Install required packages
RUN yum install -y httpd \
    zip \
    unzip && \
    yum clean all

# Download the zip file from the new URL
ADD https://raw.githubusercontent.com/Yashsharma2004/Kuberenetes_JOVAC_Project/main/wave-cafe.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Extract the zip file and clean up unnecessary files
RUN unzip wave-cafe.zip && \
    cp -rvf wave-cafe/* . && \
    rm -rf wave-cafe wave-cafe.zip

# Start Apache HTTPD service in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80  

