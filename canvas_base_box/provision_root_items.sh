#!/usr/bin/env bash

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

aptitude update
aptitude upgrade -y
aptitude install -y \
  htop\
  expect\
  build-essential\
  git\
  libxslt1-dev\
  libcurl4-openssl-dev\
  libksba8\
  libksba-dev\
  libqtwebkit-dev\
  libreadline-dev\
  libsqlite3-dev\
  sqlite3\
  postgresql\
  postgresql-server-dev-all\
  redis-server\
  vim-nox\
  imagemagick\
  silversearcher-ag\
  wget

mkdir /root/tmp/
cd /root/tmp/
wget https://nodejs.org/dist/v0.12.14/node-v0.12.14-linux-x64.tar.gz
tar -C /usr/local --strip-components 1 -xzf node-*-linux-x64.tar.gz
cd /root && rm -Rf tmp/

sudo -u postgres createuser -d vagrant

aptitude build-dep -y ruby2.0

npm install -g coffee-script@1.6.2

aptitude clean
