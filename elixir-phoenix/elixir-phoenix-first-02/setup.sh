#!/bin/bash

mkdir -p /elixir-primer/v01/ch03; cd $_ # $_ 直前に打ったコマンドの最後の引数が参照できる

cat << 'EOS' > ./Dockerfile
FROM elixir:1.3.4

SHELL ["/bin/bash", "-c"]

ENV NVMURL https://rawgit.com/creationix/nvm/v0.33.6/install.sh

ENV TEMP https://github.com/phoenixframework/archives/raw/master

RUN touch ~/.bashrc && cd /tmp && wget --no-check-certificate $NVMURL && bash ./install.sh && rm -f ./install.sh && source ~/.bashrc && nvm install 8.9

RUN mix local.hex --force && mix local.rebar && mix archive.install $TEMP/phoenix_new-1.2.5.ez --force

EOS

docker build -t modest_greeter:1.2.5 .

docker run -it -v /elixir-primer/v01/ch03:/root/elixir-primer/v01/ch03 modest_greeter:1.2.5 /bin/bash
