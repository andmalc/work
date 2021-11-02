top=['fruit','cars',['a','b']]
def nest(x):
    ''''
		read each item in sequence
		if not a list or dict, print it
		otherwise call funct again with item as arg
    '''
    for i in x:
        if isinstance(i,(list,dict)):
            nest(i)
        else:
            print i
nest(top)
