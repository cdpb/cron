# simple cron with syntax checking and logging

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
