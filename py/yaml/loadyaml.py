import yaml
import pprint

def load(f):
	return yaml.load_all(f)

class Printer(object):
	def __init__(self):
		pass



if __name__=='__main__':
	try:
		import sys
		filearg=sys.argv[1]
		d=load(open(filearg,'r'))
	except:
		d=load(open('test.yaml','r'))
	finally:
		for i in d:
			pprint.pprint(i)
