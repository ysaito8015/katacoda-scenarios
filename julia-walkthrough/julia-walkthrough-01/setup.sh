#!/bin/bash

mkdir -p /work && cd $_

wget  "https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz"
tar zxvf julia-1.2.0-linux-x86_64.tar.gz --transform 's/julia-1.2.0/julia/' -C /opt
ln -s /opt/julia/bin/julia /usr/local/bin/julia

