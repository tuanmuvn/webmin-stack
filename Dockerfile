FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget perl net-tools openssl libauthen-pam-perl libio-pty-perl apt-show-versions python unzip \
    && wget http://prdownloads.sourceforge.net/webadmin/webmin_2.021_all.deb \
    && dpkg --install webmin_2.021_all.deb || apt-get -f install -y \
    && rm webmin_2.021_all.deb \
    && apt-get clean

EXPOSE 10000

CMD ["/usr/share/webmin/start"]
