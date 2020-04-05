#!/bin/bash
set -e

ssh $deployUser@$deployHost sudo mkdir -p /etc/nginx/sites-available

rsync -ISOarz \
  build/$branchName.wallex.asia.conf $deployUser@$deployHost:/etc/nginx/sites-available/

ssh $deployUser@$deployHost sudo nginx -t
ssh $deployUser@$deployHost sudo systemctl restart nginx