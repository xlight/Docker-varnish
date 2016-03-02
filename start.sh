PORT=${BACKEND_PORT:-80}
MEM=${CACHE_SIZE:-256m}
sed -i 's|.port = "80"|.port = "${PORT}"|g'  /etc/varnish/default.vcl
/usr/sbin/varnishd -F -P /run/.pid -a :6081 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,${MEM}
