FROM docker.io/alpine:latest

RUN apk add curl cronie

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    mkdir /root/.cache

ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-i", "-m", "off", "-x", "misc"]
