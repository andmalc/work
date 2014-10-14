import gspread

# Login with your Google account
gc = gspread.login('andmalc@gmail.com', 'sasjchdzodakbhjl')

# Open a worksheet from spreadsheet with one shot
sh = gc.open("Auction Estimates Compare")

#wks.update_acell('B2', "it's down there somewhere, let me take another look.")

# Fetch a cell range
#cell_list = worksheet.range('A1:B7')
