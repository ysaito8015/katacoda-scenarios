#!/usr/bin/env bash

apt update && apt install -y inotify-tools sudo \
&& wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
&& source ~/.bashrc \
&& nvm install node\
&& mix local.hex --force && mix local.rebar --force && mix archive.install hex phx_new 1.5.13 --force
