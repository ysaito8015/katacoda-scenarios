#!/bin/bash

mkdir -p /work && cd $_

rm -rf /usr/local/go
wget  "https://golang.org/dl/go1.17.5.linux-amd64.tar.gz"
tar zxvf go1.17.5.linux-amd64.tar.gz -C /usr/local/

