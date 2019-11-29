#Humberto Meza Moreno, A01112905
import re
from collections import Counter

with open('log', 'r') as f:
    data = f.read()

data_list = re.findall(r'[\t]+[^0-9a-fA-F]{2} | [\t]+[a-z0-9]+', data)

for n, i in enumerate(data_list):
    data_list[n] = data_list[n].replace("\t", "")

values = list(Counter(data_list).values());
keys = list(Counter(data_list).keys());
print("You have "+str(len(values))+" kind of instructions in this object file:")

for n, i in enumerate(values):
	if len(keys[n]) < 8:
		s = keys[n] + '\t'
	else:
		s = keys[n]
	print('\t'+ s +'\t'+": Executed "+str(values[n])+" times")
data_instr = re.findall(r'[0-9a-fA-F]{16}[\s]+[<]+[a-z]*[>]', data)
print("You have "+str(len(data_instr))+" functions:")

for n, i in enumerate(data_instr):
	s1 = "".join(re.findall("[a-z][a-z]+", data_instr[n]))
	s2 = "".join(re.split("[^0-9a-fA-F][^0-9a-fA-F]+", data_instr[n]))
	print('\t'+s1+'\t'+": Located at "+s2+" addr")