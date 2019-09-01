#!/bin/bash

mkdir -p /elixir; cd /elixir/

docker build -t modest_greeter:1.2.5 .

docker run -it modest_greeter:1.2.5 /bin/bash
