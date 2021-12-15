#!/bin/sh
source ~/.env
# `.env`にはSUDO_PASSを設定している
echo ${SUDO_PASS} | sudo -S su

# suに失敗した時に動かないようにする意味も含めて、明示的にsudoを書かない（書く必要がない）
apt update
apt upgrade -y
apt full-upgrade -y
apt autoremove -y
