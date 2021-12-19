#!/bin/sh
# crontabの元ファイルは`/usr/lib/cron/tabs/USER`を参照（要root）
output_path="$(dirname $0)"/brew_upgrade.log

if [ -f "${output_path} " ]
then
  rm ${output_path}
fi
/usr/local/bin/brew upgrade >${output_path}
echo "[complate] brew upgrade" >>${output_path}
