FROM ubuntu:18.04
RUN apt update ; apt install openssh-client -y 
RUN apt  install openssh-server -y
RUN apt install apache2 -y
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
RUN echo root:q123 | chpasswd
RUN sed -i 's/#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY index.html /var/www/html/index.html
RUN  mkdir -p /var/run/sshd
COPY allinone.sh /bin/allinone.sh
RUN chmod +x /bin/allinone.sh
RUN echo /usr/sbin/sshd >>~/.bashrc
CMD ["/bin/allinone.sh"]
