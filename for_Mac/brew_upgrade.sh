#!/bin/sh
### crontabの元ファイルは`/usr/lib/cron/tabs/USER`を参照（要root）
### インストールは以下
### Mac: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
### Linux: `/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`

log_directory="${1:-~/logs/brew_upgrade.log}"
if [ -n "$(which brew)" ]
then
  brew upgrade >${output_path}
  message="[complate] brew upgrade. [$(date)]"

  # tee
  echo "${message}"
  echo "${message}" >>${log_directory}
fi

