FROM nginx

RUN apt-get update && \
    apt-get install curl unzip dnsutils -y

RUN curl --remote-name https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip && \
    unzip consul_0.9.0_linux_amd64.zip &&  \
    mv consul /usr/bin && \
    rm consul_0.9.0_linux_amd64.zip

RUN mkdir /var/lib/consul && chmod 777 /var/lib/consul
RUN mkdir /etc/consul.d && chmod 777 /etc/consul.d
ADD config.json /etc/consul.d/config.json
ADD nginx.json /etc/consul.d/nginx.json
ADD default-nginx-conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /
ENTRYPOINT ["sh", "docker-entrypoint.sh"]