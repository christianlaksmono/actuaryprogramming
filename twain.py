text = []
with open('twain.txt') as f:
        text = f.readlines()

replaced_twain = []

for row in text:
        replaced_twain = replaced_twain + [ row.replace("Huck","HucK") ]

x=0
for i in range (len(text)):
        if text[i].find('Huck') > -1 : #if not found = -1
        #if "Huck" in text [i] : -> sama aja
                print('Line',i)
                print("Before:",text[i])
                print("After :",replaced_twain[i])
                print()
                x=x+1
print('Number of Alter',x)

#if you want to read the whole text, remove command tag

#for row in replaced_twain :
#       print(row)


