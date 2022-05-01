# Create a base image using CentOS version 7
FROM centos:7

# LABEL is tag instruction adds metadata to an image. A LABEL is a key-value pair.
LABEL maintainers = "DevOp team "

# Update tehe system and install httpd using RUN command
RUN yum -y update && yum clean all

# install httpd 'apache'
RUN yum -y install httpd

#have to copy the application put it inside the container using copy command
COPY index.html /var/www/html/
#COPY Simon Game /var/www/html/
COPY styles.css /var/www/html/
COPY game.js /var/www/html/
COPY blue.mp3 /var/www/html/
COPY green.mp3 /var/www/html/
COPY red.mp3 /var/www/html/
COPY yellow.mp3 /var/www/html/
COPY wrong.mp3 /var/www/html/

# defind the port command
EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]

# and to stop the CMD command runing container in the background you have to do it manually Control D command
CMD ["-D", "FOREGROUND"]
