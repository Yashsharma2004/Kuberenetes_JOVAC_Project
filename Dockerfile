FROM centos:7
LABEL maintainer=" yashsharma2004.mtr@gmail.com"
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/free-css-templates/page290/wave-cafe.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80  

