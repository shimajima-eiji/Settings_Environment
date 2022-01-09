#!/bin/sh

: <<COMMENT
説明のため、以下と仮定する。
- サーバーユーザー: ssh_server
- ユーザーパスワード: 有り
- サーバーのIPアドレス: 192.168.1.1
  - IPアドレスは`hostname -I`(アイ)で確認できる
COMMENT

# サーバー側: ssh_serverユーザーで実施
sudo ssh-keygen -A
sudo sed -i -e "s/^PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config  # vi /etc/ssh/sshd_configで変更するのと同じ
sudo service ssh restart

# クライアント側: 何でもOK
ssh ssh_server@192.168.1.1
