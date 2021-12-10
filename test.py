import extensionRepair as er
from os import listdir
from os.path import isfile, join


files = [f for f in listdir("Dane") if isfile(join("Dane", f))]
er.extensionRepairBulk("Dane",files)
er.extensionRepairSingle("a","02_hackathon_task.two")