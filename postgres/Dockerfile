FROM postgres:latest

RUN apt-get update && \
    apt-get install curl unzip dnsutils -y

RUN curl --remote-name https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip && \
    unzip consul_0.9.0_linux_amd64.zip &&  \
    mv consul /usr/bin && \
    rm consul_0.9.0_linux_amd64.zip

RUN mkdir /var/lib/consul && chown -R postgres:postgres /var/lib/consul && chmod 777 /var/lib/consul
RUN mkdir /etc/consul.d && chown -R postgres:postgres /etc/consul.d && chmod 777 /etc/consul.d
ADD config.json /etc/consul.d/config.json
ADD postgres.json /etc/consul.d/postgres.json
ADD db-dump.sql /docker-entrypoint-initdb.d/db-dump.sql

# Server RPC is used for communication between Consul clients and servers for internal
# request forwarding.
EXPOSE 8300

# Serf LAN and WAN (WAN is used only by Consul servers) are used for gossip between
# Consul agents. LAN is within the datacenter and WAN is between just the Consul
# servers in all datacenters.
EXPOSE 8301 8301/udp 8302 8302/udp

# HTTP and DNS (both TCP and UDP) are the primary interfaces that applications
# use to interact with Consul.
EXPOSE 8500 8600 8600/udp

VOLUME /tmp

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint2.sh
RUN ln -s usr/local/bin/docker-entrypoint2.sh / && chmod +x docker-entrypoint2.sh

ENTRYPOINT ["docker-entrypoint2.sh"]
CMD ["postgres"]
