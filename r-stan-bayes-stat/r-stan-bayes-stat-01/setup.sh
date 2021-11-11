#!/usr/bin/env bash


groupadd devel
useradd -g devel -m devel
echo "devel  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /work && chown -R devel:devel /work

su - devel && cd /work

sudo docker pull datarefine/paper-r-dev:latest

sudo docker run -it -e DISABLE_AUTH=true -p 8787:8787 -v /work:/work -d --name rstudio datarefine/paper-r-dev:latest
