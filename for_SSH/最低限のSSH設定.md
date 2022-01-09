サーバーのディストリビューションはUbuntu:latestを使用しているので、他の場合はコマンドを読み替える

## 最低限：簡単な設定手順
1. サーバーでsshサービスを起動する
2. サーバーでパスワード認証でsshを起動する
3. クライアントからパスワード認証でログインする

### sshサーバー側の設定
事前にsshサーバーの接続先を調べておく。  
説明のためここでは、

- sshサーバーのログインユーザー: `ssh_server`
  - ログインユーザーには必ずパスワードを設定すること
- sshサーバーのIP: `192.168.1.1`

とする。  
ipアドレスを知りたい場合は、`hostname -I`(i:アイの大文字)で取得できるアドレス（複数ある場合も）


#### 1. サーバーでsshサービスを起動する
初期状態では`sudo service ssh start`を実行してもうまくいかないので、

```
sudo ssh-keygen -A
```

で、ファイルを作っておく。  
作成したファイルは`/etc/ssh`以下に作成される。

#### 2. サーバーでパスワード認証でsshを起動する
`sudo vi /etc/ssh/sshd_config`を実施し、以下を設定する。

```
# コンフィグの内容を下記のように変える。
PasswordAuthentication yes
# PasswordAuthentication no
```

`sudo service ssh start`を実施。

### クライアント側の設定
特に設定は不要。コマンドを実行するだけ。

#### 3. クライアントからパスワード認証でログインする
（この作業をしてもログインできない場合は、サーバーの設定も含めて再度見直すこと）

```
ssh ssh_server@192.168.1.1
```

パスワードを求められるので、適切なパスワードを入力すればOK。  

## さらに高度なセキュリティ
[設定を間違えると動かなくなるので注意](https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_SSH/高度な設定.md)

