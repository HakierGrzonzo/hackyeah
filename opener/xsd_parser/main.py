""" sgfdsg """
import xml.etree.ElementTree as ET
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

listOfXsdTypes = ['application/octet-stream','text/xml']
def downloadXSD(baseUrl,linkUrl):
    if len(linkUrl) == 0:
        return []
    if linkUrl[0]=='.' or linkUrl[0] == '/':
        linkUrl = urljoin(baseUrl,linkUrl)
        
    try:
        r = requests.get(linkUrl)
    except:
        print("failed to connect to : ",baseUrl,linkUrl)
        return []

    if r.status_code == 200 or r.status_code == 202:
        #print(r.headers['content-type'].split(";")[0])
        if r.headers['content-type'].split(";")[0] in listOfXsdTypes:
            print(linkUrl)
            return r.text
        else:
            soup = BeautifulSoup(r.text,features='lxml')
            results = []
            for link in soup.findAll('a'):
                if link.get('href') is not None and link.get('href')[-3:] in ['xsd','xml']:
                    results.append(downloadXSD(linkUrl,link.get('href')))
        return results

def downloadSchemas(filepath):

    namespaces = dict([node for _,node in ET.iterparse(filepath,events=['start-ns'])])
    schemas = dict()
    
    for name in  namespaces:
        r = requests.get(namespaces[name])
        if r.status_code == 200 or r.status_code == 202:
            #try:
            downloadXSD("",namespaces[name])
            #except Exception as e:
                #print("Failed to download schema")
        else:
            print ("Error downloading schema: ",namespaces[name])

    return schemas

downloadSchemas("xml/file1")
