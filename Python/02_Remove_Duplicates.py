s=input()
d=set()
s1=""
for i in s:
    if(i not in d):
        d.add(i)
        s1+=i 
print(s1)
