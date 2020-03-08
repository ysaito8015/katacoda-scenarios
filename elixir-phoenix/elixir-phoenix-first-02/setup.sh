#!/bin/bash

mkdir -p /work/projects/elixir-primer/v01/ch03; cd /work/projects

cat << 'EOS' > ./Dockerfile
FROM elixir:1.9.1

SHELL ["/bin/bash", "-c"]

RUN touch ~/.bashrc && cd /tmp \
&& wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
&& source ~/.bashrc \
&& nvm install \
&& apt update \
&& apt install -y inotify-tools

RUN mix local.hex --force && mix local.rebar --force && mix archive.install phx_new --force

EOS

docker build -t modest_greeter:1.4.10 .

docker run -it -v /work/projects:/work/projects -p 4000:4000 modest_greeter:1.4.10 /bin/bash
