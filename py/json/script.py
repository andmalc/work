import csvutil, csv, simplejson,pickle
TEST=1 

def store():
    p= open('data.pickle','wb')
    j=open('dotMobi/20080619.json','r')
    pickle.dump(simplejson.load(j),p)
    p.close()

def getdata():
    if TEST is not 1:
        return pickle.load('data.pickle')
    else:
        d={'fruit':
                {'apples': 
                    {'flavor':'tasty','color':'red'} , 
                'oranges':'val'
                }
            }
        return d

def flatten(seq, out,):
    for item in seq:
        out += item + ' '
        val = seq[item]
        if isinstance(val,(dict)):
            flatten(val,out)
        else:
            out += val + '\n'

if __name__ == '__main__':
    data = getdata()
    out=''
    out = flatten(data,out)


#f=open('out.csv','w')
#c = csvutil.UnicodeWriter(f)

#for i in data:
#   c.writerow(i)
#   for j in data['i']:
#       c.writerow(j)

#f.close()


