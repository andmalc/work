#/usr/bin/zsh

nova boot --image c382e6b2-e507-4f93-967e-b785f6be3379 --flavor 100 --security-groups default --key_name hpcloud jessie
nova add-floating-ip jessie 15.126.199.124
