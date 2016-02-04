FROM debian:jessie

RUN apt-get update
RUN apt-get install apt-transport-https
RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update
RUN apt-get install varnish


