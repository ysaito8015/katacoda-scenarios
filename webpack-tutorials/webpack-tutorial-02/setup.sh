#!/usr/bin/env bash

# install tree and apache2
apt update && apt install -y tree apache2

wait 2

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
  && source ~/.bashrc \
  && nvm install --lts && nvm alias default lts/*

wait 2

# get source code
mkdir /work && cd $_
wget -qO- https://github.com/ysaito8015/webpack-demo/archive/getting_started.tar.gz | tar --transform 's/webpack-demo-getting_started/webpack-demo/' -zx \
 && npm update

wait 2

# apache2 settings
sed -i.bak -e 's/\/var\/www\/>/\/work\/webpack-demo>/g' /etc/apache2/apache2.conf
sed -i.bak -e 's/\/var\/www\/html/\/work\/webpack-demo\/dist/g' /etc/apache2/sites-available/000-default.conf
apache2ctl restart
