主にGithub就活・転職用のもの。関係あるものは無差別に入れる

# 毎日漏れなくGithubに草をはやしたい
githubに自動で草を生やすためだけのファイル群。要は↓これを埋めたい
<img src="https://grass-graph.appspot.com/images/shimajima-eiji.png">

https://grass-graph.appspot.com

## for Windows
1. `everyday_contribute.bat`をタスクスケジューラから呼び出して任意のタイミングで実行する
1. `clone_windows_path`はこのリポジトリをクローンした場所をwindowsのパスの書き方で指定する（サンプルはC直下を想定している）

パスに日本語が入ってはいけない事を留意する。

## for Mac(Linux)
1. `everyday_contribute.sh`をcronから呼び出して任意のタイミングで実行する

- windowsの時はbatでcdしているが、macの場合はgitコマンドを実行するためsh内で移動する必要がある
- bashでもzshでも使えるが、他のshellは未検証

## 注意
最新化されるのに１日ほど時間がかかるようなので、焦らず気長に待とう
