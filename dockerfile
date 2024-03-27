FROM centos:latest
LABEL maintainer="semabiaoscar@gmail.com"

RUN yum install -y httpd zip unzip

ADD photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
