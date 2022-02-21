#!/bin/sh
# crontabの元ファイルは`/usr/lib/cron/tabs/USER`を参照（要root）
: <<README
# update_mac_summary.sh
## 概要
for_Mac以下のアップデートを自動で行うためのスクリプト

## 使い方
#``
curl -sf https://raw.githubusercontent.com/shimajima-eiji/__Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s
#``

## READMEバージョン
2022.02.21

README

cd ~
curl_develop_url=https://raw.githubusercontent.com/shimajima-eiji/__Operation-Maintenance/main/for_Development/setup_develop-code.sh
curl -sf ${curl_develop_url} >~/setup_develop-code.sh
source ~/setup_develop-code.sh
rm ~/setup_develop-code.sh

if [ ! "$(type -t __check_setup_develop_code)" = "function" ]
then
  echo "[Info] Failed curl. not found [${curl_develop_url}]"
fi

curl_base_url=https://raw.githubusercontent.com/shimajima-eiji/__Settings_Environment/main/for_terminal
curl -sf ${curl_base_url}/brew_upgrade.sh | sh -s
curl -sf ${curl_base_url}/anyenv_update.sh | sh -s
