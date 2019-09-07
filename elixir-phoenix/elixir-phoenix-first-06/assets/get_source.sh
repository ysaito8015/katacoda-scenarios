#!/usr/bin/env bash

cd /root/oiax/projects/

wget -qO- https://github.com/ysaito8015/elixir-primer/archive/ch03.tar.gz | tar --transform 's/elixir-primer-ch[0-9][0-9]/elixir-primer/' -zx \
  && mkdir -p /root/oiax/projects/elixir-primer/v01/
