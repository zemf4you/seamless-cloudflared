FROM alpine:latest

WORKDIR /root

RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
RUN cp ./cloudflared-linux-amd64 /usr/local/bin/cloudflared
RUN chmod +x /usr/local/bin/cloudflared

COPY ./start.sh /etc/cloudflared/start.sh

ENTRYPOINT ["sh", "/etc/cloudflared/start.sh"]
