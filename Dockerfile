FROM centos:7
LABEL maintainer="yashsharma2004.mtr@gmail.com"
RUN yum install -y httpd \
 zip\
 unzip
ADD https://templatemo.com/download/templatemo_591_villa_agency /var/www/html/
WORKDIR /var/www/html/
RUN unzip templatemo_591_villa_agency.zip 
RUN cp -rvf templatemo_591_villa_agency./* .
RUN rm -rf templatemo_591_villa_agency templatemo_591_villa_agency.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
