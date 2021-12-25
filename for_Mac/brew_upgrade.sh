#!/bin/sh
# crontabの元ファイルは`/usr/lib/cron/tabs/USER`を参照（要root）
output_path="$(dirname $0)"/brew_upgrade.log

if [ -f "${output_path} " ]
then
  rm ${output_path}
fi

if [ -z "$(which brew)" ]
then
  echo "[Stop] brew not found."
  exit 1
else
  brew upgrade >${output_path}
  echo "[complate] brew upgrade" >>${output_path}
fi

