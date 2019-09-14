#!/bin/bash

mkdir -p /work; cd $_

export CODER_URL=" https://github.com/cdr/code-server/releases/download/1.1156-vsc1.33.1/code-server1.1156-vsc1.33.1-linux-x64.tar.gz"
wget -qO- $CODER_URL | tar --transform 's/code-server1.1156-vsc1.33.1-linux-x64.tar.gz/code-server/g' -zxv -C /opt

/opt/code-server/code-server -N -p 23000
