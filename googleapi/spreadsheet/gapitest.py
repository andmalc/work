"""
clientid="1099258452299-o0glkncn9au08kvsud4crmlkndj2siqa.apps.googleusercontent.com"
clientsecret="1QOIu9wc6n4ochChoH-kzCJm"
scope="https://spreadsheets.google.com/feeds"

redirect="urn:ietf:wg:oauth:2.0:oob"

#from apiclient.discovery import build
#service = build("

"""
key="0AsUmBbBY_9iHdHd5MTNuRzJJb0l0cWJsSUlLQjdsV3c"
import gdata.spreadsheet.service
import gdata.spreadsheets.client
from gdata.spreadsheets.client import 

def getSSClient():
    spr_client = gdata.spreadsheet.service.SpreadsheetsService()
    spr_client.email='andmalc@gmail.com'
    spr_client.password='sasjchdzodakbhjl'
    spr_client.source='Auction Estimates Compare'
    spr_client.ProgrammaticLogin()
    return spr_client

requesturl="https://spreadsheets.google.com/feeds/spreadsheets/private/full"                                                                 

"""
import gdata.spreadsheets.client
client = gdata.spreadsheets.client.SpreadsheetsClient()
def gettoken():
    email='andmalc@gmail.com'
    password='sasjchdzodakbhjl'
    appname='myname'
    return client.ClientLogin(email,password,appname,service='cl')
"""


