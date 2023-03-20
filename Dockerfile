FROM centos:latest
MAINTAINER prvinsm20@gmail.com

RUN sed -i "s/mirrorlist/#mirrorlist/g" /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-Linux-*

RUN yum install -y httpd \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/loxury.zip /var/www/html/
WORKDIR /var/www/html

RUN unzip loxury.zip
RUN cp -R loxury/* .
RUN rm -rf loxury/ loxury.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
