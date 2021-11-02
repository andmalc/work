import unittest

class SomeTests(unittest.TestCase):
    def setUp(self):
        self.arg=0
    def xtestReturnsNone(self):
        self.assertIsNone(returnsnone())
    def testReturnsFalse(self):
        self.assertTrue(returnsnone(self.arg))



def returnsnone(arg=None):
    return arg


if __name__=='__main__':
    unittest.main()

