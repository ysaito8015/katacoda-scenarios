#!/bin/bash

mkdir -p /work && cd $_

wget  "https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz"
tar zxvf go1.13.1.linux-amd64.tar.gz -C /opt
ln -s /opt/go/bin/go /usr/local/bin/go
ln -s /opt/go/bin/gofmt /usr/local/bin/gofmt


wget -O- https://raw.githubusercontent.com/danicat/pacgo/master/step06/maze01.txt > /work/pacgo/maze01.txt
wget -O- https://raw.githubusercontent.com/danicat/pacgo/master/step05/main.go > /work/pacgo/main.go

