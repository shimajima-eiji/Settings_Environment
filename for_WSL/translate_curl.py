# -*- coding: utf-8 -*-
# python3を想定しているが、2系でも動くか

import requests  # need pip
import json      # need pip
import sys

args = sys.argv
ENDPOINT = args[1]
output_file = args[2]

response = requests.get(ENDPOINT)
data = response.json()

with open(output_file, 'w') as f:
  f.write(json.dumps(data))
