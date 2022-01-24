#!/bin/sh
### curl -sf https://raw.githubusercontent.com/shimajima-eiji/__Settings_Environment/main/for_terminal/node_update.sh | sh -s

# nodeがないか、npmのパスが通っていないならやらない
if [ ! "$(which npm)" ]
then
  exit
fi

# npm自体のアップデート
npm install -g npm

# npmのパッケージのアップデート
# ncuコマンド(`npm install -g npm-check-updates`)が使えない場合はやらない
if [ ! "$(which ncu)" ]
then
  exit
fi

# ローカルパッケージの更新。package.jsonがないならやらない
if [ -f "package.json" ]
then
  ncu -u
fi

global_update() {
  ### `ncu -u -g`の出力例（アップデートがある場合）
  ##### ```
  ##### [====================] 4/4 100%
  #####
  ##### zenn-cli  0.1.104  →  0.1.105
  #####
  ##### ncu itself cannot upgrade global packages. Run the following to upgrade all global packages:
  #####
  ##### npm -g install zenn-cli@0.1.105
  #####
  ##### ```
  ###
  ### `ncu -u -g`の出力例（アップデートがない場合）
  ##### ```
  ##### [====================] 4/4 100%
  #####
  ##### All global packages are up-to-date :)
  ##### ```
  ###
  ### アップデートありの出力は`tail -n 2 | head -n 1`で`npm -g install パッケージ`があり、なければ結果はなし
  ### (今回の場合は`npm -g install zenn-cli@0.1.105`)
  ### これを再起処理することで最終的には結果なしになる想定
  ###
  ### 何も考えず、全部最新化するので共同開発中や運用環境での使用は厳禁

  result="$(ncu -u -g | tail -n 2 | head -n 1)"

  if [ "${result}" ]
  then
    # `exec "${result}"`ではダメ
    exec $(echo "${result}")
    global_update
  fi
}

global_update
