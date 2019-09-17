#!/usr/bin/env bash

mkdir -p /work && cd /work

docker pull data-refine/stan-d:latest

docker run -it -e PASSWORD=rstanrocker -p 8787:8787 data-refine/stan-d:latest /bin/bash
