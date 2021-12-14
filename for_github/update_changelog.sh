#!/bin/sh
. ~/.env  # ここではGITHUB_REPO_TOKENの変数を参照するため、.envには以下を記述しておく
# GITHUB_REPO_TOKEN=パスワード

#--- 適宜変更すること
user=(user)
file=CHANGELOG.md
tmpfile=tmp
#--- 変更箇所はここまで

# チェックロジック
stop_flag=false
# 必要なコマンド（パッケージ）の確認
if [ -z "$(which github_changelog_generator)" ]
then
  echo "[stop] Require github_changelog_generator.(`which github_changelog_generator: https://github.com/github-changelog-generator/github-changelog-generator`)"
  stop_flag=true
fi

if [ -z "$(which github_changelog_generator)" ]
then
  echo "[stop] Require github_changelog_generator.(`which github_changelog_generator: https://github.com/github-changelog-generator/github-changelog-generator`)"
  stop_flag=true
fi

# リポジトリについては、引数で変更できるようにしておく
if [ -z "$1" ]
then
  echo "[stop] Require repository"
  stop_flag=true
else
  repository=$1
fi

if [ ${stop_flag} ]
then
  exit 1
fi


# .envがない、GITHUB_REPO_TOKENが設定されていない場合はユーザーに入力させる
if [ -z "${GITHUB_REPO_TOKEN}" ]
then
  read -p "[input] github token(required permission repo):" GITHUB_REPO_TOKEN
fi

# 移動先: /タスクスケジューラ/changelog更新機/ファイル
cd "$(dirname ${0})/../../"

stop_flag=false  # 処理を継続するか判断するためのフラグ。立ったら中断
if [ "$(git config user.name)" = "" ]
then
  echo "[stop] Required `git config user.name.`"
  stop_flag=true
fi

if [ "$(git config user.email)" = "" ]
then
  echo "[stop] Required `git config user.email.`"
  stop_flag=true
fi

# 処理を中断する条件にあたった場合は中断させる
if [ ${stop_flag} = true ]
then
  exit 1
fi

github_changelog_generator -u ${user} -p ${repository} -t ${GITHUB_REPO_TOKEN} --issues-label "### 終了・または先送りしたissue" --header-label "# 日付順" --unreleased-label "指定なし"
github-changes -o ${user} -r ${repository} -k ${GITHUB_REPO_TOKEN} --use-commit-body -t "タグ別" -z Asia/Tokyo -m "YYYY年M月D日" -n "最終更新" -a -f tmp
cat ${tmpfile} >>${file}
rm ${tmpfile}

git add ${file}
git commit -m "update: ${file}"
git tag "v${date '+v%Y/%m/%d'}"
git push --tags
