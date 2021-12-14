# 秘密鍵(id_rsa)について
`chmod 600 id_rsa`を実行しないとエラーになる
<br />たとえば、GithubのSSHキー登録で使う公開鍵(id_rsa.pub)は https://github.com/settings/keys に登録しておく。

- windowsの場合: `C:\Users\(ユーザー)\.ssh`
- Mac/WSL(Linux)の場合: `/home/(ユーザー)/.ssh`

# TortoiseGit(Windows)で使う場合
id_rsaを`.ppk`に変換する必要がある。
<br />`PuttyGen`を使うと変換できる。
