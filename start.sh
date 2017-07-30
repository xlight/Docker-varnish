
# Convert environment variables in the conf to fixed entries
# http://stackoverflow.com/questions/21056450/how-to-inject-environment-variables-in-varnish-configuration

for name in BACKEND_PORT
do
    eval value=\$$name
    sed -i "s|.port = \"80\"|.port = \"${value}\"|g" /etc/varnish/default.vcl
done

mkdir /etc/varnish.d
cd /etc/varnish.d/ && touch .all_includes.vcl
ls *.vcl | awk '{print "include \"/etc/varnish.d/"$1"\";"}' > .all_includes.vcl 


/usr/sbin/varnishd -F -P /run/.pid -a :${SERV_PORT} -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,${CACHE_SIZE}
