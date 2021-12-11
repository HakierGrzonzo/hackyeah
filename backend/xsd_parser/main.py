""" sgfdsg """
import xml.etree.ElementTree as ET
import requests
from bs4 import BeautifulSoup
#from url_normalize import url_normalize

listOfXsdTypes = ['application/octet-stream','text/xml','text/html']

def canonizeUrl(url):
    new_url = []
    old_url = url.split("/")
    for i in range(0,len(old_url) -1):
        if old_url[i+1] != ".." and old_url[i] != "..":
            new_url.append(old_url[i])
    new_url.append(old_url[-1])
    return "/".join(new_url)

def parseLink(base_url,link_url):
    full_link = link_url
    if link_url[:4] != "http":
        full_link = base_url+"/"+link_url;

    full_link = canonizeUrl(full_link)
    return full_link
    
def downloadXSD(base_url,link_url,depth = 0):
    if len(link_url) == 0 or depth >1: #recursion safeguard
        return []
    full_link = parseLink(base_url,link_url)

    try:
        r = requests.get(full_link)
    except Exception as e:
        print("failed to connect to : ",full_link)
        return []

    if r.status_code == 200 or r.status_code == 202:
        results = []
        if r.headers['content-type'].split(";")[0] in listOfXsdTypes and full_link[-3:] in ['xsd','xml']:
            print(full_link)
            return [r.text]
        elif r.headers['content-type'].split(";")[0] in ['text/html','html/plain']:
            soup = BeautifulSoup(r.text,features='lxml')
            results = []
            for link in soup.findAll('a'):
                if link.get('href') is not None and link.get('href')[-3:] in ['xsd','xml']:
                    results.append(downloadXSD(full_link,link.get('href'),depth+1))
        return results

def downloadSchemas(filepath):

    namespaces = dict([node for _,node in ET.iterparse(filepath,events=['start-ns'])])
    schemas = dict()
    
    for name in  namespaces:
        r = requests.get(namespaces[name])
        if r.status_code == 200 or r.status_code == 202:
            try:
                downloadXSD("",namespaces[name])
            except Exception as e:
                print("Failed to download schema")
        else:
            print ("Error downloading schema: ",namespaces[name])

    return schemas

downloadSchemas("xml/file2")
