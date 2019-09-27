#!/usr/bin/env bash

touch ~/.bashrc \
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
  && source ~/.bashrc \
  && nvm install --lts && nvm alias default lts/* \
  && mkdir -p /work && cd /work \
  && wget -qO- https://github.com/ysaito8015/webpack-demo/archive/getting_started.tar.gz | tar --transform 's/webpack-demo-getting_started/webpack-demo/' -zx \
  && npm update \
  && sed -i.bak -e 's/\/var\/www\/>/\/work\/webpack-demo>/g' /etc/apache2/apache2.conf \
  && sed -i.bak -e 's/\/var\/www\/html/\/work\/webpack-demo\/dist/g' /etc/apache2/sites-available/000-default.conf \
  && apache2ctl restart
