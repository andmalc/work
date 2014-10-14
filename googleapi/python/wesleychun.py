

import apiclient.discovery
from apiclient.discovery import build

API_KEY = 'AIzaSyBMMawRqk6oLU0cYH8q-XhTs1QAfrxXMjA'
SERVICE = build('plus', 'v1', developerKey=API_KEY)

TMPL = '''
    User: %s
    Date: %s
    Post: %s
'''

items = SERVICE.activities().search(query='python').execute().get('items', [])

for data in items:
    post = ' '.join(data['title'].strip().split())
    if post:
        print TMPL % (data['actor']['displayName'], data['published'], post)



