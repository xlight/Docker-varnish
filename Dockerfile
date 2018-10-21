FROM debian:jessie

RUN apt-get update && apt-get install -y apt-transport-https curl
RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.deb.sh |  bash
RUN apt-get install -y --force-yes varnish varnish-dev make && apt-get clean
RUN curl https://download.varnish-software.com/varnish-modules/varnish-modules-0.12.1.tar.gz -o varnish-modules-0.12.1.tar.gz  &&  \
  tar -zxvf varnish-modules-0.12.1.tar.gz && \
  cd varnish-modules-0.12.1 && \
  ./configure && \
  make && \
  make install 
RUN curl https://raw.githubusercontent.com/xlight/varnish-5.0-configuration-templates/master/default.vcl -o /etc/varnish/default.vcl
WORKDIR /root
ENV BACKEND_PORT 80
ENV CACHE_SIZE 256m
ENV SERV_PORT 6081
RUN curl https://raw.githubusercontent.com/xlight/Docker-varnish/docker-varnish5/start.sh -o/root/start.sh
USER root
CMD sh /root/start.sh
