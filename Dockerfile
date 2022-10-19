FROM ubuntu:18.04
LABEL name=akash
LABEL email=aakashgaur57@gmail.com
RUN apt update ; apt install openssh-server  apache2  supervisor docker.io  -y
RUN mkdir -p /var/log/supervisor
RUN echo root:q123 | chpasswd
RUN sed -i 's/#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY index.html /var/www/html/index.html
RUN  mkdir -p /var/run/sshd
RUN mkdir -p /var/run/apache2
CMD ["/usr/bin/supervisord"]
