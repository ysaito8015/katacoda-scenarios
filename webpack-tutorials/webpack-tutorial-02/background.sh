#!/usr/bin/env bash

export CODER_URL="https://github.com/cdr/code-server/releases/download/2.1523-vsc1.38.1/code-server2.1523-vsc1.38.1-linux-x86_64.tar.gz"

wget -qO- $CODER_URL | tar --transform 's/code-server2.1523-vsc1.38.1-linux-x86_64/code-server/' -zxv -C /opt

/opt/code-server/code-server -N -p 23000 &
