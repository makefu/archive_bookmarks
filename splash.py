#! /usr/bin/env python2

import requests
import html2text

splash_url="http://localhost:8050/render.json"

p = {
        "url": "http://google.de",
        "timeout":60,
        "html":"1",
}

print(requests.get(splash_url,params=p).json())
