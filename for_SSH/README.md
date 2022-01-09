環境によらないが、難しいので専用のディレクトリを作成。  
この作業を全て実施した場合に、必要なファイル構成は以下の通り。

## サーバー側
- ssh_configとssh【d】_configがあり、編集するのは[ssh【d】_config]
- ssh_host_○○_key は**秘密鍵**
- ssh_host_○○_key.pub は公開鍵

```
/etc/ssh/
├── ssh_host_dsa_key
├── ssh_host_dsa_key.pub
├── ssh_host_ecdsa_key
├── ssh_host_ecdsa_key.pub
├── ssh_host_ed25519_key
├── ssh_host_ed25519_key.pub
├── ssh_host_rsa_key
├── ssh_host_rsa_key.pub
└── sshd_config
```

## サーバーとクライアント
作業時はサーバー/クライアントのどちらで実施しているか確認する。

```
~/.ssh/
├── authorized_keys  # サーバー。 上記の/etc/ssh/以下の.pubを追記する
├── config           # クライアント
└── ssh_host_○○_key  # クライアント。サーバー側にある/etc/ssh/以下の秘密鍵を置く
```

## SSH初心者の方向け
とりあえず読んで意味がわかって実行すれば動くshファイルを置いておく。  
高度な設定については、解説の内容を正しく理解して設定できないと意味がないので、ここでは敢えて作成していない。
