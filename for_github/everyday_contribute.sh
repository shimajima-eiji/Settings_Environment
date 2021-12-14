#!/bin/sh

update_file="dummy"

if [ -z "$1"]
then
  echo "[stop] Require argument: path(git clone directory)"
  exit 1
else
  git_clone_path=$1
fi

cd ${git_clone_path})

today=$(date "+%Y/%m/%d")
echo "dummy update: $today" >$update_file
git add $update_file
git commit -m "dummy update: $today"
git push
