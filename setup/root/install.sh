#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh

# Install any packages
pacman -S nginx

curl -sS --create-dirs -o /tmp/timesched/timesched.tar.gz https://github.com/djmattyg007/timesched/releases/download/djcustom-v${TIMESCHED_VERSION}/djcustom-v${TIMESCHED_VERSION}-release.tar.gz
cd /tmp/timesched
tar xzf timesched.tar.gz
rm timesched.tar.gz
cp -R release /data
chmod -R -w /data
cd /

# Cleanup
pacman_cleanup
