#!/bin/sh

cron_envs=$(env | grep CRON_)
cron_tmp=$(mktemp)

if [[ -z "${cron_envs}" ]]; then
  echo "no crontabs provided"
  echo "use env CRON_<name>='cron expr'"
  echo "e.g. CRON_HELLO='* * * * * echo hello world'"
  exit 1
fi

IFS=$'\n'
for cron in ${cron_envs}; do
  cron_head=$(echo "${cron}" | cut -d'=' -f1)
  cron_expr=$(eval echo \$$cron_head)
  echo "${cron_expr}" > ${cron_tmp}_${cron_head}
  crontab -T ${cron_tmp}_${cron_head} 
  if [[ $? -eq 0 ]] ; then
    echo "add $cron_head"
    echo "${cron_expr}" >> ${cron_tmp}
  fi
done

if [[ -s ${cron_tmp} ]]; then
  crontab ${cron_tmp}
else
  echo "didn't find valid crontab"
  exit 1
fi

exec $@
