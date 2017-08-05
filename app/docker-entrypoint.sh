java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar &
echo "search consul \nnameserver 127.0.0.1 \nnameserver 127.0.0.11 \noptions ndots:0" > /etc/resolv.conf \
&& service dnsmasq restart &
consul agent -config-dir /etc/consul.d 