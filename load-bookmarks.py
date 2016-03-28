#! /usr/bin/env python3
"""usage: load-bookmarks [--only-es] FILE """
import json
from docopt import docopt
import datetime
import requests
import logging

# TODO handle_children without global var
urls = []
splash_url="http://localhost:8050/render.json"
es_url="http://localhost:9200/"

def getFiletime(dtms):
    # Ref: # https://stackoverflow.com/questions/19074423/how-to-parse-the-date-added-field-in-chrome-bookmarks-file
    # @Randy Skretka
    seconds, micros = divmod(dtms, 1000000)
    days, seconds = divmod(seconds, 86400)

    return (datetime.datetime(1601, 1, 1) + \
            datetime.timedelta(days, seconds, micros)).isoformat()

def handle_children(ch,path):
    if not path: path = []
    for v in ch:
        n = v['name']
        if v['type'] == 'folder':
            nch = v['children']
            if nch: handle_children(nch, list(path) + [ n ] )
        elif v['type'] == 'url':
            v['path'] = path
            v['date_added'] = getFiletime(int(v['date_added']))
            if 'date_modified' in v:
                v['date_modified'] = getFiletime(int(v['date_modified']))
            # TODO del v['meta_info'] if not important
            del v['type']
            urls.append(v)

def main():
    args = docopt(__doc__)
    with open(args['FILE']) as f:
        j = json.load(f)
        # import pdb;pdb.set_trace()
        if not args['--only-es']:
            handle_children([ v for v in j['roots'].values() if type(v) == dict],None)
            ret = handle_urls(urls)
        else:
            ret = j
    to_elasticsearch(ret)
    print(json.dumps(ret))

def to_elasticsearch(urls):
    from datetime import datetime
    index = "bookmarks"
    s = requests.Session()
    for u in urls:
        ident = u.pop('_id')
        typ = "{}".format(datetime.now().strftime("%Y-%m-%d"))
        url = "{}/{}/{}/{}".format(es_url,index,typ,ident)
        print(s.post(url,json=u).json())

# TODO: get html2text, archive link, thumbnail

def fetch_url(url):
    p = {
            "url": url,
            "timeout":60,
            "png":"1",
            "html":"1",
    }
    if url.endswith('.pdf'):
        # raise TypeError ('will not handle pdfs')
        loggin.error('will not handle pdfs')
        return {}
        # raise TypeError ('will not handle pdfs')
    d = requests.get(splash_url,params=p).json()
    d['scraped'] = datetime.datetime.now().isoformat()
    return d

def create_thumb(pngdata):
    from PIL import Image
    from StringIO import StringIO
    import base64
    im = Image.open(StringIO(pngdata.decode('base64')))
    im.thumbnail((200,150),Image.ANTIALIAS)
    ret = StringIO()
    im.save(ret,format="png")
    ret.seek(0)
    return "data:image/png;base64,"+ret.read().encode('base64').replace('\n','')

def create_text(htmldata):
    import html2text
    h = html2text.HTML2Text()
    h.ignore_links = True
    h.ignore_images = True
    return h.handle(htmldata)


def handle_urls(ourls):
    from multiprocessing import Pool
    from functools import partial
    from time import sleep
    import sys,json
    from minibar import Minibar

    pool = Pool(processes=1)
    #urls = ourls[:3]
    #urls = ourls[:30]
    urls = ourls[:]

    ret = pool.map_async(fetch_url,[data['url'] for data in urls],chunksize=1)

    template = "{i}/{total} {bar} elapsed:{elapsed}s eta:{eta}"
    bar = Minibar(total=len(urls),template=template,out=sys.stderr)

    while not ret.ready():
        bar.counter = (len(urls)- ret._number_left) or 1
        bar.render()
        sleep(0.05)

    for data in ret.get():
        thisurl = data.get('requestedUrl',None)
        if not thisurl:
            logging.error("{} - no requestedUrl".format(str(data)))
            continue
        for u in urls:
            if u['url'] == thisurl:
                u['thumbnail'] = create_thumb(data['png'])
                u['html'] = data['html']
                u['text'] = create_text(data['html'])
                u['added'] = data['scraped']

    return urls


if __name__ == "__main__":
    main()
