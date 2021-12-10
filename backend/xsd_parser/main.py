""" sgfdsg """
import xml.etree.ElementTree as ET
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def downloadXSD(baseUrl,linkUrl):
    if linkUrl[0]=='.' or linkUrl[0] == '/':
        linkUrl = urljoin(baseUrl,linkUrl)
        
    print(linkUrl)
    r = requests.get(linkUrl)

    if r.status_code == 200 or r.status_code == 202:
        return r.text;

def downloadSchemas(filepath):

    namespaces = dict([node for _,node in ET.iterparse(filepath,events=['start-ns'])])
    schemas = dict()
    
    for name in  namespaces:
        r = requests.get(namespaces[name])
        if r.status_code == 200 or r.status_code == 202:
            soup = BeautifulSoup(r.text);
            for link in soup.findAll('a'):
                schemas[name] = (downloadXSD(namespaces[name],link.get('href')))
        else:
            print ("Error downloading schema: ",namespaces[name])

    return schemas;

downloadSchemas("xml/file1")
