#!/bin/bash
set -e
ssh $deployUser@$deployHost sudo mkdir -p $projectPath/$branchName/releases/$GITHUB_SHA/
ssh $deployUser@$deployHost sudo chown -R ec2-user:ec2-user $projectPath/$branchName

rsync -ISOarz \
   --links \
   --exclude=".git" \
   --exclude=".git*"  \
   --exclude=".docker*" \
   --exclude=".DS_Store"  \
   --exclude="logs/*"  \
   --exclude="build" \
   --exclude="flow-typed" \
   --exclude="node_modules" \
   --delete-excluded \
   --delete \
  ./* $deployUser@$deployHost:$projectPath/$branchName/releases/$GITHUB_SHA
