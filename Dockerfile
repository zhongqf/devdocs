
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
# RUN thor docs:download css dom dom_events javascript html http angular angularjs bootstrap c cakephp coffeescript cpp django docker elixir ember git github go immutable knockout kotlin laravel less lodash markdown meteor moment node php phpunit python react react_native redux redis typescript underscore vue webpack sass rust socketio
RUN thor docs:download css dom dom_events javascript html http angular angularjs bootstrap@3 bootstrap@4 git c cpp immutable lodash markdown moment react redux underscore sass less

RUN thor docs:generate java --force

EXPOSE 9292
CMD rackup -o 0.0.0.0

