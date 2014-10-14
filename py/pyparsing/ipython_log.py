#log# Automatic Logger file. *** THIS MUST BE THE FIRST LINE ***
#log# DO NOT CHANGE THIS LINE OR THE TWO BELOW
#log# opts = Struct({'__allownew': True, 'logfile': 'ipython_log.py'})
#log# args = []
#log# It is safe to make manual edits below here.
#log#-----------------------------------------------------------------------
from pyparsing import *
_ip.magic("logstart ")

from pyparsing import *
date = Word(nums,exact=2)("day") + '-' + \
Word(alphas,exact=3)("month") + '-08'
