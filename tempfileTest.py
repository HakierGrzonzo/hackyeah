import tempfile

with tempfile.TemporaryFile() as fp:
    with open ("a/01_hackaton_copy.txt","r") as file:
        print(file.read().replace('\n',''))
        fp.write(bytes(file.read().replace('\n',''),"UTF8"))
        fp.seek(0)
        print(fp.read())
