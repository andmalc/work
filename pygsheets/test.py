
import pygsheets
import pandas as pd
#authorization
gc = pygsheets.authorize(service_file='./andmalc-ec4e1143eb4a-service-account-key.json')

# Create empty dataframe
df = pd.DataFrame()

# Create a column
#df['name'] = ['John', 'Steve', 'Sarah']

#open the google spreadsheet (where 'PY to Gsheet Test' is the name of my sheet)
sh = gc.open('Test Sheet General')

#select the first sheet 
wks = sh[0]

#update the first sheet with df, starting at cell B2. 
#wks.set_dataframe(df,(1,1))
