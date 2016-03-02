# Docker-varnish
varnish with a good vcl

# run like this
    docker run -d --name some-varnish -p80:6081 --link <nginx>:backend -e BACKEND_PORT=8080 -e CACHE_SIZE=32m xlight/docker-varnish
