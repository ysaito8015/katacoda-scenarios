#!/bin/bash

mkdir -p /work; cd $_

docker pull elixir:1.13.2

docker run -it -v /work:/work -p 4000:4000 elixir:1.13.2 /bin/bash
