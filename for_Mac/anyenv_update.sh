#!/bin/sh
# Thanks: https://zenn.dev/ryuu/articles/use-anyversions

if [ -z "$(which anyenv)" ]
then
  echo "[Stop] 'anyenv' not found."
  exit 1
fi

# .anyenv 配下にプラグイン管理用のディレクトリ作成
# -pオプションのおかげでエラーにならないので、ここでチェックはしない
mkdir -p $(anyenv root)/plugins

# プラグインをGitHubからクローン
# 必要がなければcloneしないよう追記
plugin_path=$(anyenv root)/plugins/anyenv-update
if [ ! -d "${plugin_path}" ]
then
  git clone https://github.com/znz/anyenv-update.git ${plugin_path}
fi

# インストールされたenvの一括アップデート
$ anyenv update
