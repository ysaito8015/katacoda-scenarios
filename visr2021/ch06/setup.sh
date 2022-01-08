#!/usr/bin/env bash

mkdir -p /work && chown -R packer:packer /work

su - packer && cd /work

sudo docker pull datarefine/rstudio-visual:latest

sudo docker run -it -e DISABLE_AUTH=true -p 8787:8787 -v /work:/home/rstudio/work -d --name rstudio datarefine/rstudio-visual:latest
