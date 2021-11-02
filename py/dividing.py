import unittest



class SumOfStrNums(unittest.TestCase):
    def setUp(self):
       self.str='1.1.1.1'
       #self.str='192.168.2.13'

    def testsumme(self):
        self.assertEqual( summe(self.str),4 )



def summe(str):
    splitstr=str.split('.')
    t=0
    for i in splitstr:
        t+=int(i)
    return t
    

if __name__ == '__main__':
    unittest.main() 


