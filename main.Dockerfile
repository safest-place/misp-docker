FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
RUN install -d -m 0755 /srv/misp
COPY INSTALL.sh /tmp/
COPY entrypoint.sh /srv/misp/
RUN useradd misp
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt update && apt install -y wget curl net-tools lsb-release sudo tzdata
RUN adduser misp sudo
RUN echo "misp ALL=(ALL) NOPASSWD: NOPASSWD: ALL" >> /etc/sudoers
USER misp
RUN bash /tmp/INSTALL.sh -A
WORKDIR /var/www/MISP/app
RUN sudo php composer.phar install --no-dev

USER root
COPY entrypoint.sh /srv/misp/
COPY database.php /var/www/MISP/app/Config/
COPY misp-ssl.conf /etc/apache2/sites-available/
COPY config.php /var/www/MISP/app/Plugin/CakeResque/Config/
RUN chown www-data:www-data -R /var/www/MISP/app
ENTRYPOINT ["/srv/misp/entrypoint.sh"]
