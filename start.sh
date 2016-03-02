
# Convert environment variables in the conf to fixed entries
# http://stackoverflow.com/questions/21056450/how-to-inject-environment-variables-in-varnish-configuration

for name in BACKEND_PORT
do
    eval value=\$$name
    sed -i "s|.port = \"80\"|.port = ${value}|g" /etc/varnish/default.vcl
done

/usr/sbin/varnishd -F -P /run/.pid -a :6081 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,${CACHE_SIZE}
