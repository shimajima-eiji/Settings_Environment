#!/bin/sh
# crontabの元ファイルは`/usr/lib/cron/tabs/USER`を参照（要root）

# 後述の引数チェックでログディレクトリを指定しない場合が考えられるため、初期値を入れておく
log_directory=~/logs

# 引数をチェックし、インストールオプションならインストールフラグを立て、そうでなければ最後の引数をログディレクトリとして扱う
for arg in "$@"; do

  echo "デバッグ: ${arg}"

  if [ "$(echo "${arg}" | grep -x '-i' -e -x '--install')" ]
  then
    install_flag="-i"
  else
    log_directory="${arg}"
  fi
done

echo ${log_directory}
exit 0

output_path=${log_directory}/brew_upgrade.log

# ルートを指定できないようにする
if [ "$(dirname ${output_path})" = "/" ]
then
  echo "[Stop] The specified path is the root. ${output_path}"
  exit 1
fi

# ログを出力するディレクトリを調べる。パスがディレクトリ名と一致したファイルもしくはシンボリックリンクだった場合、ログを作らない
if [ -f "${log_directory}" -o -L "${log_directory}" ]
then
  echo "[Warn]Failed to create log directory: ${log_directory}"
  log_directory=""
  
# ファイルもディレクトリも存在しない場合は、ディレクトリを作成する。
elif [ ! -d "${log_directory}" ]
then
  mkdir -p ${log_directory}
  if [ ! "$?" = "0" ]
  then
    echo "[Warn]Failed to create log directory: ${log_directory}"
    log_directory=""
  fi
fi

# ログファイルを書き込む場合、既に古いログファイルが存在していたら予め削除しておく
if [ -n "${log_directory}" -a -f "${output_path}" ]
then
  rm ${output_path}
fi

if [ -z "$(which brew)" ]
then

  # brewのインストールフラグがあればインストール
  if [ -n "${install_flag}" ]
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # brewのインストールに失敗した場合、updateはできないので終了する
    if [ -z "$(which brew)" ]
    then
      echo "[Stop] Failed to brew install"
      echo "command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
      echo ""
      echo "[Hint] Make sure the path contains ¥$PATH? which brew: /usr/local/bin/brew"
      exit 1
    fi

  # インストールフラグがなければ終了
  else
    echo "[Stop] brew not found."
    exit 1
  fi

# brewが存在していればupdateを実行
else
  brew upgrade >${output_path}
  message="[complate] brew upgrade. [$(date)]"
  echo "${message}"
  
  # ログファイルを書く場合のみ、ログファイルにも出力する
  if [ -n "${log_directory}" ]
  then
    echo "${message}" >>${output_path}
  fi
fi

