#!/bin/sh
# curlでの実行に対応している

# 基本的には.envに書き込まれている
if [ -f "~/.env" ]
then
  source ~/.env
fi

# 標準入力があれば優先する（セキュリティの観点から非推奨）
SUDO_PASS=${1:-${SUDO_PASS}}

# sudoに失敗した場合は実行しない
if [ -z "${SUDO_PASS}" ]
then
  echo "[Stop]Need pass of sudo."
  echo "[Hint] create ~/.env. after 'SUDO_PASS=(your password)'."
  exit 1
fi

# ルートユーザーにスイッチできなかった場合は実行しない
echo "${1:-${SUDO_PASS}}" | sudo -S su
if [ ! "${USER}" = "root" ]
then
  echo "[Stop]Failed 'su'."
  echo "[Hint]Wrong sudo pass? view SUDO_PASS of '~/.env'"
  exit 1
fi

# 以下、rootユーザーで実施
apt update
apt upgrade -y
apt full-upgrade -y
apt autoremove -y
