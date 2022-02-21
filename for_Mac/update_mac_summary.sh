#!/bin/sh
# for_Mac以下のアップデートを自動で行うためのスクリプト
#
# 呼び出しは以下のように行う
# 更新時    : `curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s`
# インストール: `curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s -- -i`
# -iまたは--installを引数に渡すと、インストールを許可する（それぞれのスクリプトを参照）

curl_directory=https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_terminal

# 引数が-iか--installの時だけインストールフラグを立てる
if [ "$1" = "-i" -o "$1" = "--install" ]
then
  install_arg=$1
fi

curl -sf ${curl_directory}/brew_upgrade.sh | sh -s -- ${install_arg}
curl -sf ${curl_directory}/anyenv_update.sh | sh -s -- ${install_arg}
