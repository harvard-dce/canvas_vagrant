#!/usr/bin/env bash

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

echo "gem: --no-rdoc --no-ri" >> /home/vagrant/.gemrc
echo "source ~/.bashrc_additions.sh" >> ~/.bashrc

git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
printf 'export PATH="$HOME/.rbenv/bin:$PATH"\n' >> /home/vagrant/.profile
printf 'eval "$(rbenv init - --no-rehash)"\n' >> /home/vagrant/.profile

git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash
git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

source ~/.profile
# This will find the latest official ruby release supported by ruby-build
# mri_ruby_version=$(rbenv install -l | egrep " [[:digit:]]\.[[:digit:]]\.[[:digit:]]$" | tail -1)

# This will find the latest 2.1.x ruby release supported by ruby-build
mri_ruby_version=$(rbenv install -l | egrep " 2\.1\.[[:digit:]]$" | tail -1)

rbenv install ${mri_ruby_version}
rbenv global ${mri_ruby_version}
rbenv rehash

gem install foreman
gem install bundler --version=1.7.10
git clone https://github.com/instructure/canvas-lms canvas-lms
cd canvas-lms
git checkout master
# log/ not automatically created any more
mkdir log
bundle install --without mysql

for config in amazon_s3 database delayed_jobs domain file_store outgoing_mail security external_migration;
do cp -v config/${config}.yml.example config/${config}.yml; done

echo "
development:
  servers:
    - redis://localhost
  database: 1

test:
  servers:
    - redis://localhost
  database: 2
" > config/redis.yml

createdb canvas_development
createdb canvas_queue_development
expect < ~/.canvas_initial_setup.exp

npm install
bundle exec rake canvas:compile_assets
