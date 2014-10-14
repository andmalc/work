def docstest():
    import gdata.docs.data
    import gdata.docs.client
    client = gdata.docs.client.DocsClient(source='andmalc')
    client.ssl = True  # Force all API requests through HTTPS
    client.http_client.debug = False  # Set to True for debugging HTTP requests
    client.ClientLogin('andmalc@gmail.com', 'iTurnip22', client.source);

    feed=client.GetDocList(uri="/feeds/default/private/full/-/document?title='ann-cdn'")
    doc=feed.entry[0]
    print doc.resource_id.text

def sstest():
    import gdata.spreadsheet.service
    import gdata.docs.service
    ss_client = gdata.spreadsheet.service.SpreadsheetsService()
    ss_client.email = 'andmalc@gmail.com'
    ss_client.password='iTurnip22'
    ss_client.source = 'data_pusher' 
    ss_client.ProgrammaticLogin()
    q = gdata.docs.service.DocumentQuery()
    q['title'] = "stocks"
    q['title-exact']='false'
    feed = ss_client.GetSpreadsheetsFeed(query=q)


def main():
    # Tutorial http://www.doughellmann.com/PyMOTW/argparse/
    import argparse
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument("-a", action="store", dest="torun")
    parser.print_help()
    print  parser.parse_args()


if __name__ == '__main__':
#    main()
    sstest()

