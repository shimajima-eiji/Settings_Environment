#!/bin/sh
# Thanks: https://zenn.dev/ryuu/articles/use-anyversions

install_arg=$1

if [ -z "$(which anyenv)" ]
then

  # 引数があればインストールオプションとして扱うため、brew_upgrade.shのような厳密なロジックを入れない
  if [ -n "${install_arg}" ]
  then
    echo "[Info] 'anyenv' not found. install by brew"
    
  else
    echo "[Stop] 'anyenv' not found."
    exit 1
  fi
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
anyenv update
