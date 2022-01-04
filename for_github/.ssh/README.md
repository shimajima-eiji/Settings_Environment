## 権限
`chmod`コマンドで以下の通り設定する
- 0644: config
- 0600: 秘密鍵

### コマンド例
```
cd ~/.ssh
chmod 644 config
chmod 600 秘密鍵
```

## 公開鍵/秘密鍵の作り方
最も簡単な方法を記すが、セキュリティ上の問題からもっと良い方法がある。  
[参考](https://qiita.com/suthio/items/2760e4cff0e185fe2db9)（リンク先のECDSA鍵への言及は2014年時点での話なので聞き流すべき）

```
ssh-keygen -t rsa
```

で、`id_rsa`と`id_rsa.pub`が生成される。
Githubに登録するのは`id_rsa.pub`で、configにパスを通すのは`id_rsa`である。

### tortoiseGit(Windows GUI)で使う場合
秘密鍵をputtyGenで.ppkに変換する必要がある。
