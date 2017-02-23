
FROM ruby:2.3.3
MAINTAINER Conor Heine <conor.heine@gmail.com>

RUN apt-get update
RUN apt-get -y install git nodejs
COPY . /devdocs
RUN gem install bundler

WORKDIR /devdocs

RUN bundle install --system

# RUN thor docs:download --all

# only download required documents
RUN thor docs:download angular angularjs bootstrap c cakephp coffeescript cpp django docker elixir ember git github go immutable knockout kotlin laravel less lodash markdown meteor moment node php phpunit python react react_native redux redis typescript underscore vue webpack sass rust socketio

RUN thor docs:generate java --force

EXPOSE 9292
CMD rackup -o 0.0.0.0

