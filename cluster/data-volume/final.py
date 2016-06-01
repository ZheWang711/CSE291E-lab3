#!/usr/bin/python3

import sys
f = open(sys.argv[1])
#f = open("bigram-result.txt")
lst = []
cnt = 0
acc_sum = 0
acc_num = 0

for line in f:
    tmp = line.split()
    lst.append((str(tmp[0] + tmp[1]), int(tmp[2])))
    cnt += int(tmp[2])

lst.sort(key = (lambda x: x[1]), reverse = True)

for i in range(len(lst)):
    acc_sum += lst[0][1]
    acc_num += 1
    if acc_sum >= 0.1*cnt:
        break;

print ("Total number of bigrams:", cnt)
print ("Most common bigrams:", lst[0][1])
print ("Number of bigrams required to add to 10% of all bigrams", acc_num)
