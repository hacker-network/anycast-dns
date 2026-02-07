FROM alpine:3.23

RUN apk --no-cache add bird supervisor
RUN wget https://github.com/pymumu/smartdns/releases/download/Release47.1/smartdns-x86_64 -O /usr/sbin/smartdns
RUN chmod +x /usr/sbin/smartdns
RUN mkdir /etc/smartdns

COPY bird.conf /etc/bird.conf
COPY smartdns.conf /etc/smartdns/smartdns.conf
COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
