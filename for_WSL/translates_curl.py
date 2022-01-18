# python3を想定。python2では動かない
import sys
import requests  # need pip install
import json

args = sys.argv
ENDPOINT = args[1]  # 'https://script.google.com/macros/s/AKfycbxb_apSejoLX7iyP4WWUAJHB8twLoI40QdL5G9C6O5d_DAmjYVQY37ndj6Uakh_pnOPtQ/exec'
OUTPUT_FILEPATH = args[2]

# エンドポイントと出力ファイル、翻訳したい文字がないと中断
if not ENDPOINT or not OUTPUT_FILEPATH or len(args[3:]) == 0:
  print("[STOP] Required 'Endpoint' and 'Translate result(JSON) export file-path' and some words")
  quit()

# 引数から入力を受け取って翻訳したファイルを作成する
def translates():
  headers = {
    'Content-Type': 'application/json',
  }

  body = json.dumps({
    "text": sys.argv[3:],
    "source": "en",
    "target": "ja",
    "by": "translates.py"
  })
  response = requests.post(ENDPOINT, headers=headers, data=body)
  data = response.json()
  with open(OUTPUT_FILEPATH, 'w') as f:
    f.write(json.dumps(data, ensure_ascii=False))

  print(f"[COMPLETE: translates]  Result file=>({OUTPUT_FILEPATH})")

translates()
