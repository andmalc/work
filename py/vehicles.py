class Bike:
    def __init__(self,name,vtype):
        self.name=name
        self.vtype=vtype
    def start(self,speed=0):
        self.speed=speed
    def getVals(self):
        return self.__dict__
    def printVals(self):
        dict=self.getVals()
        for d in dict:
            print d,dict[d]


class Car:
    def __init__(self,name,vtype):
        self.name=name
        self.vtype=vtype
    def start(self,speed=0):
        self.speed=speed

class Fruit:
    def __init__(self,name,vtype):
        self.name=name
        self.vtype=vtype
    def flavour(self,taste='tasty'):
        self.taste=taste
	print "The flavor of this %s is %s" % (self.name,self.taste)

def main():
    bike1=Bike('bobbike','recumbent')
    bike2=Bike('joebike','tandom')
    car1=Car('nicecar','SUV')
    fruit1=Fruit('my banana','banana')
    vehicles=[bike1,bike2,car1,fruit1]
    bike1.start(5)
    bike2.start(8)
    print bike1.printVals()
    for v in vehicles:
        if hasattr(v,'speed'):
            print (v.name)
        if hasattr(v,'taste'):
            print (v.name)

a='hi'