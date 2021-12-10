""" sgfdsg """
import xml.etree.ElementTree as ET
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

listOfXsdTypes = ['application/octet-stream','text/xml']
def downloadXSD(baseUrl,linkUrl):
    if linkUrl[0]=='.' or linkUrl[0] == '/':
        linkUrl = urljoin(baseUrl,linkUrl)
        
    print(linkUrl)
    r = requests.get(linkUrl)

    if r.status_code == 200 or r.status_code == 202:
        if r.headers['content-type'] in listOfXsdTypes:
            return r.text
        else:
            print("we need to go deeper")
            soup = BeautifulSoup(r.text, features='lxml')
            results = []
            for link in soup.findAll('a'):
                try:
                    results.append(downloadXSD(linkUrl,link.get('href')))
                except:
                    print("failed to download schema", linkUrl ," : ",link.get('href'))
        return results;

def downloadSchemas(filepath):

    namespaces = dict([node for _,node in ET.iterparse(filepath,events=['start-ns'])])
    schemas = dict()
    
    for name in  namespaces:
        r = requests.get(namespaces[name])
        if r.status_code == 200 or r.status_code == 202:
            downloadXSD("",namespaces[name])
        else:
            print ("Error downloading schema: ",namespaces[name])

    return schemas;

downloadSchemas("xml/file1")
