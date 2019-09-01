#!/bin/bash

mkdir -p /elixir; cd /elixir/

cat << 'EOS' > ./Dockerfile
FROM elixir:1.3.4

ENV NVMURL https://rawgit.com/creationix/nvm/v0.33.6/install.sh

ENV TEMP =https://github.com/phoenixframework/archives/raw/master

RUN cd /tmp && wget --no-check-certificate $NVMURL && bash ./install.sh && rm -f ./install.sh

ENV NVM_DIR $HOME/.nvm
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

RUN nvm install 8.9

RUN mix local.hex --force && mix local.raber && mix archive.install $TEMP/phoenix_new-1.2.5.ez --force

WORKDIR /app
EOS

docker build -t modest_greeter:1.2.5 .

docker run -it modest_greeter:1.2.5 /bin/bash
