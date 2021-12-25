#!/bin/sh
# for_Mac以下のアップデートを自動で行うためのスクリプト
#
# 呼び出しは以下のように行う
# `curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s`
#
# -iまたは--installを引数に渡すと、インストールを許可する（それぞれのスクリプトを参照）

install_arg=""

# 引数がなければupdateとして扱う
if [ -n "$1" ]
then
  # -iか--installの時以外はupdateとして扱う
  if [ "$1" = "-i" | "$1" = "--install" ]
  then
    install_arg=$1
  fi
fi

curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s -- ${install_arg}
