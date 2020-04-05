#!/bin/bash
set -e
mkdir -p ~/.ssh
cat ./.github/build/known_hosts >> ~/.ssh/known_hosts
(umask  077 ; echo $deployKey | base64 --decode > ~/.ssh/id_rsa)