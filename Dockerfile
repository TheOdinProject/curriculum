#
# If using Dockerfile alone, make sure that you have a postgres DB
# up and running, using the `pgdb` name and that the container is
# on the same network as this container.
#

FROM ruby:2.6-buster
MAINTAINER Andy Duss <mindovermiles262@gmail.com>

RUN apt-get -qq update && \
  apt-get -qq install -y nodejs vim

ENV RAILS_ENV=docker
ADD . /rails
WORKDIR /rails
RUN bin/bundle install


RUN bin/rails db:create && \
    bin/rails db:migrate && \
    bin/rails db:seed

EXPOSE 3000
CMD bin/rails server

