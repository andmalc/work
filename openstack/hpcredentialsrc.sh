
#!//usr/bin/zsh

# With the addition of Keystone, to use an openstack cloud you should
# authenticate against keystone, which returns a **Token** and **Service
# Catalog**.  The catalog contains the endpoint for all services the
# user/tenant has access to - including nova, glance, keystone, swift.
#
# *NOTE*: Using the 2.0 *auth api* does not mean that compute api is 2.0.  We
# will use the 1.1 *compute api*
export OS_AUTH_URL='https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/'
export OS_USERNAME="andmalc"
export OS_TENANT_NAME="andmalc-project1"
export OS_PASSWORD='SV55Qv0c5fXd'
export OS_COMPUTE_API_VERSION=1.1

#token='ZK82GDF1K1J6RLGNXDVU'
#export OS_TENANT_ID='andmalc-project1'
