#!/bin/sh
update_file=dummy

for now_day in $(seq 0 366)  # 当日を含めるので0からカウント
do
  message="dummy update: $(date -d "-${now_day} days" "+%Y/%m/%d")"
  echo "${message}" >${update_file}

  git add ${update_file}  # -aをコミットに使うと`git add`は要らないが、念の為ファイルを指定する
  git commit -m "${message}" --date="$(date -d "-${now_day} days")"

  echo "${now_day} / 366: ${message}"  # debug
  echo ""
done
git push
