# -*- coding: utf-8 -*-
# python3を想定しているが、2系でも動くか

import requests  # need pip
import json      # need pip
import sys

args = sys.argv
output_file = args[1]
text = args[2]
source = args[3]
target = args[4]

ENDPOINT = 'https://script.google.com/macros/s/AKfycbxb_apSejoLX7iyP4WWUAJHB8twLoI40QdL5G9C6O5d_DAmjYVQY37ndj6Uakh_pnOPtQ/exec'

response = requests.get(f'{ENDPOINT}?text={text}&source={source}&target={target}')
data = response.json()

with open(output_file, 'w') as f:
  f.write(json.dumps(data))
