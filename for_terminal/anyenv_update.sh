#!/bin/sh
curl -sf https://raw.githubusercontent.com/shimajima-eiji/__Operation-Maintenance/main/for_Development/setup_develop-code.sh >./setup_develop-code.sh
source ./setup_develop-code.sh
rm ./setup_develop-code.sh

__start $0
__search_shell $0
# FYI: https://zenn.dev/ryuu/articles/use-anyversions

# anyenvが使えない場合は処理をしない
if [ -z "$(which anyenv)" ]
then
  __skip "'anyenv' not installed."
  __end $0
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

__end $0
