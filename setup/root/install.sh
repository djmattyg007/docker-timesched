#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh

# Install any packages
echo "Installing nginx..."
pacman -S --noconfirm nginx
mkdir -p /var/log/nginx
chmod 775 /var/log/nginx && chown http:http /var/log/nginx
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log

echo "Downloading timesched v${TIMESCHED_VERSION} tarball"
curl -L -sS --create-dirs -o /tmp/timesched/timesched.tar.gz https://github.com/djmattyg007/timesched/releases/download/djcustom-v${TIMESCHED_VERSION}/djcustom-v${TIMESCHED_VERSION}-release.tar.gz
cd /tmp/timesched
tar xzf timesched.tar.gz
rm timesched.tar.gz
cp -R release /data
chmod -R -w /data && chmod -R a+rX /data
cd /

# Cleanup
pacman_cleanup
