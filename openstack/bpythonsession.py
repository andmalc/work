import sys
import keystoneclient.v2_0.client as ksclient
import novaclient
#import credentials
endpoint = 'https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens'
pw = 'SV55Qv0c5fXd'
tenant= 'andmalc-project1'
username = 'andmalc'
token='ZK82GDF1K1J6RLGNXDVU'
nova = novaclient.Client(endpoint=endpoint, token=token)
#keystone = ksclient.Client(endpoint=endpoint, token=token)
#keystone = ksclient.Client(auth_url=auth_url, username=username, password=pw, tenant_name=tenant)
#glance_endpoint = keystone.service_catalog.url_for(service_type='image', endpoint_type='publicURL')
#print glance_endpoint

#from novaclient import client as novaclient
#creds = credentials.get_nova_creds()
#nova = novaclient.Client('1.1',**creds())
nova.servers.list()

