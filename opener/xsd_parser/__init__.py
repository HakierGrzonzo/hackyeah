import xml.etree.ElementTree as ET
import requests
import os
from bs4 import BeautifulSoup
#from url_normalize import url_normalize

listOfXsdTypes = ['application/octet-stream', 'text/xml', 'text/html']


def canonizeUrl(url):
    new_url = []
    old_url = url.split("/")
    for i in range(0, len(old_url) - 1):
        if old_url[i + 1] != ".." and old_url[i] != "..":
            new_url.append(old_url[i])
    new_url.append(old_url[-1])
    return "/".join(new_url)


def parseLink(base_url, link_url):
    full_link = link_url
    if link_url[:4] != "http":
        full_link = base_url + "/" + link_url

    full_link = canonizeUrl(full_link)
    return full_link


def downloadXSD(base_url, link_url, data, depth=0):
    if len(link_url) == 0 or depth > 1:  #recursion safeguard
        return []
    full_link = parseLink(base_url, link_url)

    try:
        r = requests.get(full_link)
    except Exception as e:
        print("failed to connect to : ", full_link)
        return []

    if r.status_code == 200 or r.status_code == 202:

        if r.headers['content-type'].split(
                ";")[0] in listOfXsdTypes and full_link[-3:] in [
                    'xsd', 'xml', 'xsl'
                ]:
            #print(full_link)
            data[full_link[-3:]].append(full_link)
            #data[full_link[-3:]].append(r.text)

        elif r.headers['content-type'].split(";")[0] in [
                'text/html', 'html/plain'
        ]:
            soup = BeautifulSoup(r.text, features='lxml')
            for link in soup.findAll('a'):
                if link.get('href') is not None and link.get('href')[-3:] in [
                        'xsd', 'xml', 'xsl'
                ]:
                    downloadXSD(full_link, link.get('href'), data, depth + 1)


def downloadSchemas(filepath):

    namespaces = dict(
        [node for _, node in ET.iterparse(filepath, events=['start-ns'])])
    schemas = {'xsd': [], 'xsl': [], 'xml': []}

    for name in namespaces:
        r = requests.get(namespaces[name])
        if r.status_code == 200 or r.status_code == 202:
            try:
                downloadXSD("", namespaces[name], schemas)
            except Exception:
                print("Failed to download schema")
        else:
            print("Error downloading schema: ", namespaces[name])

    return schemas


def openFiles(filepath):
    dir = os.path.dirname(os.path.realpath(filepath))
    filename = os.path.basename(os.path.realpath(filepath))
    print("file in folder: ", dir, " with name: ", filename)
    try:
        file = open(filepath, 'rb')
        print("Creating: ", os.path.join(dir, "extended-" + filename))
        extended = open(os.path.join(dir, "extended-" + filename + ".xml"), 'wb')
        return file, extended
    except Exception:
        print("Failed to open file")
        return None, None


def prependFile(filepath):
    original, extended = openFiles(filepath)
    if original is None or extended is None:
        print("Failed to open file")
        return
    resources = downloadSchemas(filepath)
    if resources is None:
        print("Failed to read resources from file")
        return
    styles = '<?xml version="1.0" ?>'
    for style in resources['xsl']:
        styles += f'<?xml-stylesheet type="text/xsl" href="{style}" ?>'
    extended.write(bytes(styles, 'utf-8'))
    data = original.read()
    print(data)
    extended.write(data)
    return extended.name


