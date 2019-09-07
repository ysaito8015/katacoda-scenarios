#!/usr/bin/env bash

cd /root/oiax/projects/

wget -qO- https://github.com/ysaito8015/modest_greeter/archive/ch11.tar.gz | tar --transform 's/modest_greeter-ch[0-9][0-9]/modest_greeter/' -zx \
  && cd /root/oiax/projects/modest_greeter/ \
  && mix deps.get \
  && npm install && node node_modules/brunch/bin/brunch build
