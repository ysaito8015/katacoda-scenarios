#!/usr/bin/env bash

mkdir -p /work && cd /work

docker pull datarefine/paper-r-dev:latest

docker run -it -e PASSWORD=password -p 8787:8787 -v ~:/home/rstudio -d --name name_of_container data-refine/paper-r-dev:latest
