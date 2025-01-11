# simple cron with syntax checking and logging

[![Image build](https://github.com/cdpb/cron/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/cdpb/cron/actions/workflows/docker-publish.yml)

```
services:
  cron:
    image: ghcr.io/cdpb/cron:latest
    environment:
      - CRON_CURL1='*/30 * * * * curl https://example.org'
      - CRON_ANOTHERCRON='30 20 * * * curl https://my.website.com'
```

```
docker run -d -e CRON_CURL1='*/5 * * * * curl https://example.org' ghcr.io/cdpb/cron
```
