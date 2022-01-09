#!/bin/sh
: >>COMMENT
need `brew install cwebp`
curl -sf https://raw.githubusercontent.com/shimajima-eiji/Settings_Environment/main/for_Mac/file2webp.sh | sh -s -- (ディレクトリパス)
.gitや.githubディレクトリなど、隠しファイルは対象にしない。
COMMENT

# ディレクトリパスを引数に指定する
arg=$1
if [ ! -d "${arg}" ]
then
  echo "[Stop] arg isn't directory. ${arg}"
  exit 1
fi

function find_file() {
  arg="$1"

  # 変数がファイルならwebpに変換。
  if [ -f "${arg}" ]
  then

    # 拡張子がwebp以外のファイルなら変換
    if [ ! "${arg##*.}" = "webp" ]
    then
      cwebp "${arg}" -o "${arg%.*}.webp" 2>/dev/null
      if [ "$?" -eq 0 ]
      then
        echo "[COMPLETE] ($(pwd)/)${arg} -> ${arg%.*}.webp"

      else
        echo "[Skip] ($(pwd)/${arg}) can't convert."
      fi
    fi

  # 変数がファイル以外ならディレクトリを移動してサーチする
  else
    cd "${arg}"

    for path in *
    do
      find_file "${path}"
    done
    cd ..
    echo
  fi
}

find_file "${arg}"
