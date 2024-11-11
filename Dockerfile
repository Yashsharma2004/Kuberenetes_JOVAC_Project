FROM centos:7
LABEL maintainer="yashsharma2004.mtr@gmail.com"
RUN yum install -y httpd \
 zip\
 unzip
RUN wget -O /var/www/html/viking.zip https://www.free-css.com/assets/files/free-css-templates/download/page285/viking.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip viking.zip
RUN cp -rvf viking/* .
RUN rm -rf viking viking.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443
