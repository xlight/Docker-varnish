FROM debian:jessie

RUN apt-get update && apt-get install -y apt-transport-https curl
RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.deb.sh.deb | bash
RUN apt-get install -y varnish
RUN apt-get clean
RUN curl https://raw.githubusercontent.com/xlight/varnish-4.0-configuration-templates/master/default.vcl -o /etc/varnish/default.vcl
WORKDIR /root
ENV BACKEND_PORT 80
ENV CACHE_SIZE 256m
ENV SERV_PORT 6081
RUN curl https://raw.githubusercontent.com/xlight/Docker-varnish/master/start.sh -o/root/start.sh
CMD sh /root/start.sh
