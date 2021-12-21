FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wget   -y
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh forum
RUN echo 'You can play the awesome Cloud NOW! - Message from Uncle LUO!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'service mysql restart' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
