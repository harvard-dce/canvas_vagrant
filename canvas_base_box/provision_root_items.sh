#!/usr/bin/env bash

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

aptitude update
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
  nodejs\
  npm

ln -s /usr/bin/nodejs /usr/bin/node

sudo -u postgres createuser -d vagrant

aptitude build-dep -y ruby2.0

npm install -g coffee-script@1.6.2

aptitude clean
