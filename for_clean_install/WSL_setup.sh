#!/bin/sh
source ~/.env  # ここではSUDO_PASSの変数を参照するため、.envには以下を記述しておく
# SUDO_PASS=パスワード

add_pathfile=~/.profile

if [ "`whoami`" = "root" ]; then
  echo "[info] sudoかrootで実行されたので、github-changesとgithub_changelog_generatorを入れる"

  apt update && apt upgrade -y
  apt install build-essential npm ruby ruby-dev gem -y
  npm install -g github-changes
  gem install github_changelog_generator

else
  echo ${SUDO_PASS} | sudo -S echo "[info] ユーザーで実施されたのでlinuxbrewとanyenvを入れる"
  sudo apt update && sudo apt upgrade -y
  sudo apt install build-essential  # Ubuntu20.04で検証

  if [ "$(which brew)" = "" ]
  then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>${add_pathfile}
  fi

  if [ "$(which anyenv)" = "" ]
  then
    brew install anyenv
    echo 'eval "$(anyenv init -)"' >>${add_pathfile}
    echo "anyenv: install done."
  else
    echo "anyenv: skip."
  fi

  # rbenvでruby3を入れる場合は、apt install zlib1g-devも必要
  for env in "nodenv" "rbenv" "pyenv"
  do
    if [ "$(which ${env})" = "" ]
    then
      brew install ${env}
      echo "PATH=~/.${env}/shims:${PATH}" >>${add_pathfile}
      echo "${env}: install done."
    else
      echo "${env}: skip."
    fi
  done
fi

# 例として、作成時点の最新版を適用させる
<<install
nodenv install 17.2.0
nodenv global 17.2.0
rbenv install 3.0.3
rbenv global 3.0.3
pyenv install 3.10.0
pyenv global 3.10.0
install
