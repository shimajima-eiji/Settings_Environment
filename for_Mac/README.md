# for_Mac(WSL)
いろいろな用途で使える

### インストール
以下コマンドを実施する。
```
curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s -- -i
# または
curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s -- --install
```

### 更新
インストールコマンド、または以下コマンドを実施する。
```
curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/update_mac_summary.sh | sh -s
```

※更新の場合は、インストールコマンドを実行しても同じ結果になる。

## brewでインストールするパッケージ
|パッケージ名|用途|
|---|---|
|nodenv|macのnode,npmのバージョンが古いので、最新化するために必要|
|rbenv|nodenvと同じ理由|
|jq|json形式の文字列をいい感じに表示する。クエリ操作もできる。|

- anyenvはbrewで管理するなら必要ではない。
  - ただし、brewでの管理をやめてanyenvに移行する記事も多く見つかることから、一長一短な部分がある。

## App Store
|パッケージ名|用途|
|---|---|
|Xcode|iOSアプリ開発に必須|

## その他インストーラを使用したもの
|パッケージ名|用途|
|---|---|
|[PlayOnMac](https://www.playonmac.com)|exeファイル(Windowsの実行形式)をMacで動かすために必要|
