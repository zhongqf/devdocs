
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
RUN thor docs:download angular
RUN thor docs:download angularjs
RUN thor docs:download bootstrap
RUN thor docs:download c
RUN thor docs:download cakephp
RUN thor docs:download coffeescript
RUN thor docs:download cpp
RUN thor docs:download django
RUN thor docs:download docker
RUN thor docs:download elixir
RUN thor docs:download ember
RUN thor docs:download git
RUN thor docs:download github
RUN thor docs:download go
RUN thor docs:download immutable
RUN thor docs:download knockout
RUN thor docs:download kotlin
RUN thor docs:download laravel
RUN thor docs:download less
RUN thor docs:download lodash
RUN thor docs:download markdown
RUN thor docs:download meteor
RUN thor docs:download moment
RUN thor docs:download node
RUN thor docs:download php
RUN thor docs:download phpunit
RUN thor docs:download python
RUN thor docs:download react
RUN thor docs:download react_native
RUN thor docs:download redux
RUN thor docs:download redis
RUN thor docs:download typescript
RUN thor docs:download underscore
RUN thor docs:download vue
RUN thor docs:download webpack
RUN thor docs:download sass
RUN thor docs:download rust
RUN thor docs:download socketio

RUN thor docs:generate java --force

EXPOSE 9292
CMD rackup -o 0.0.0.0

