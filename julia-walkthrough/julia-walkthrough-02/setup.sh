#!/bin/bash

mkdir -p /work && cd $_

wget  "https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz"
tar zxvf go1.13.1.linux-amd64.tar.gz -C /opt
ln -s /opt/go/bin/go /usr/local/bin/go
ln -s /opt/go/bin/gofmt /usr/local/bin/gofmt

