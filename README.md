# Docker-varnish
varnish with a good vcl

# run like this
    docker run -d --name some-varnish -p80:6081 --link <nginx>:backend \
    -e BACKEND_PORT=8080 -e CACHE_SIZE=32m \
    xlight/docker-varnish

# notice:
because of the limition of Varnish , the [backend] container could not be scale to more than 1 . 
so , you may have to use a load-balance container beween Varnish and web-servers.
