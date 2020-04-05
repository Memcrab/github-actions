#!/bin/bash
set -e

ssh $deployUser@$deployHost << EOF
  ln -Tfs $projectPath/$branchName/releases/$GITHUB_SHA $projectPath/$branchName/releases/current
  cd $projectPath/$branchName/releases
  ls -t1 . | tail -n +5 | xargs --no-run-if-empty sudo rm -rf
  ls -al
EOF