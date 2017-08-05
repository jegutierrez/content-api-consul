FROM java:8

RUN apt-get update && \
    apt-get install curl unzip dnsutils dnsmasq nano -y

RUN curl --remote-name https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip && \
    unzip consul_0.9.0_linux_amd64.zip &&  \
    mv consul /usr/bin && \
    rm consul_0.9.0_linux_amd64.zip

RUN mkdir /var/lib/consul && chmod 777 /var/lib/consul
RUN mkdir /etc/consul.d && chmod 777 /etc/consul.d
ADD config.json /etc/consul.d/config.json
ADD app.json /etc/consul.d/app.json
ADD 10-consul /etc/dnsmasq.d/
ADD dnsmasq.conf /etc/

ADD content-microsrv-0.1.0.jar app.jar
RUN sh -c 'touch /app.jar'

VOLUME /tmp

ENV JAVA_OPTS="-Dspring.profiles.active=prod"

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /
ENTRYPOINT ["sh", "docker-entrypoint.sh"]