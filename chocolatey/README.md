固有の設定ファイル等については.gitignoreに登録する事があるため、cloneして利用する際は注意

##　インストール
powershellで以下を実行する
```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install %config_path%
```

### コード解説
上から順番に、

1. chocolateyをインストール
2. chocoコマンドを実行できるようにパスを追記する
3. chocoでパッケージをインストール

ここではファイルパスを指定しているが、以下のように指定できる。

- chocolateyGUIでexportした`.config`ファイルのパス
- `clist`で表示されたパッケージ名)

## パッケージ更新
```
cup all
```

インストールした全パッケージを更新する。  
個別に指定したい場合は、allをパッケージ名に変更する。

## chocolatey等、パッケージを入れた後にやること
1. それぞれのパッケージの設定
2. chocolateyで管理されていないパッケージのインストール(通常通りインストーラーをダウンロードしたり圧縮データを解凍する方法）

諸設定が必要なものは別ファイルにて。

## パッケージのバックアップ
最も手っ取り早いのはchocolateyGUIの機能を使う方法。  
`clist -lo`はインストールされたパッケージを一覧で表示するだけなので、インポートできるように書き換える必要がある。
