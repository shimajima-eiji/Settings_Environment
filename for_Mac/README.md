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

## brewでインストールしないパッケージ
sudoでインストールする必要がある場合、brewでインストールしたユーザーディレクトリ以下の実行ファイルを参照する事ができないため、エラーになる。

|パッケージ名|用途|
|---|---|
|github-changes||
|github_changelog_generator|インストールできない場合は、`rbenv local system`で一時的に退避する事が可能|
|<s>reveal-ck</s>|<s>`slides.md`からRevealJSを作るために必要</s>VSCodeで作る方法にしたため不要|

### ○○env localの仕様
カレントに `.○○_version`を作り、`env local`で指定したものがある。  
これを削除すると、コマンド自体をなかったことにできるので、普段使いはenvだが一時的にsystem(sudo)を使いたい場合などは`local system`とする。

今のところ問題はなかった。

## App Store
|パッケージ名|用途|
|---|---|
|Xcode|iOSアプリ開発に必須|

## その他インストーラを使用したもの
|パッケージ名|用途|
|---|---|
|[Command Line Tools for Xcode](https://developer.apple.com/download/all/?q=for%20Xcode)|`xcode-select --install`では入ってこない開発用ツール。ないと一部コマンドが動かない|
|[VSCode](https://code.visualstudio.com/)|[RevealJS](https://marketplace.visualstudio.com/items?itemName=evilz.vscode-reveal)もこれで作る。|
|[PlayOnMac](https://www.playonmac.com)|exeファイル(Windowsの実行形式)をMacで動かすために必要|
