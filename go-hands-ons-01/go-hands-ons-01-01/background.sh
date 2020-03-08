#!/usr/bin/env bash

export CODER_URL="https://github.com/cdr/code-server/releases/download/3.0.0/code-server-3.0.0-linux-x86_64.tar.gz" \
 && wget -qO- $CODER_URL | tar --transform 's/code-server-3.0.0-linux-x86_64/code-server/' -zxv -C /opt \
 && /opt/code-server/code-server -N --port 23000 &
