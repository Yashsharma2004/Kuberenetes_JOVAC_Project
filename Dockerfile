FROM centos:7
LABEL maintainer="yashsharma2004.mtr@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip wget

# Download the template
RUN wget -O /var/www/html/templatemo_591_villa_agency.zip https://templatemo.com/download/templatemo_591_villa_agency

# Unzip and move contents
WORKDIR /var/www/html/
RUN unzip templatemo_591_villa_agency.zip
RUN cp -rvf templatemo_591_villa_agency/* . 

# Clean up unnecessary files to reduce image size
RUN rm -rf templatemo_591_villa_agency templatemo_591_villa_agency.zip 

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for web access
EXPOSE 80
