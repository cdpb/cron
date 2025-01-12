# simple cron with syntax checking and logging

[![Image build](https://github.com/cdpb/cron/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/cdpb/cron/actions/workflows/docker-publish.yml)

Image is available via
```
docker.io/cdpb/cron:latest
```

## Usage

```
services:
  cron:
    image: docker.io/cdpb/cron:latest
    environment:
      - CRON_CURL1='*/30 * * * * curl https://example.org'
      - CRON_ANOTHERCRON='30 20 * * * curl https://my.website.com'
```

```
docker run -d -e CRON_CURL1='*/5 * * * * curl https://example.org' docker.io/cdpb/cron
```

## Syntax checking

Image uses buildin cronie syntax checking to discard any invalid cron expressions


```
docker run -e CRON_INVALID='*/5 * * * echo invalid' -e CRON_VALID='* * * * * echo valid' docker.io/cdpb/cron:latest

"/tmp/tmp.FHInBL_CRON_INVALID":1: bad day-of-week
Invalid crontab file. Syntax issues were found.
No syntax issues were found in the crontab file.
add CRON_VALID
Backup of root's previous crontab saved to /root/.cache/crontab/crontab.bak
debug flags enabled: misc
[1] cron started
log_it: (CRON 1) STARTUP (1.7.2)
log_it: (CRON 1) INFO (RANDOM_DELAY will be scaled with factor 32% if used.)
log_it: (CRON 1) No inotify - daemon runs with -i or -c option ()

```
