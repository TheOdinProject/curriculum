#
# If using Dockerfile alone, make sure that you have a postgres DB
# up and running, using the `pgdb` name and that the container is
# on the same network as this container.
#

FROM ruby:2.6-buster
LABEL maintainer="Andy Duss <mindovermiles262@gmail.com>"

RUN apt-get -qq update && \
  apt-get -qq install -y nodejs vim

WORKDIR /rails
COPY bin bin
COPY Gemfile* ./
RUN bin/bundle install

ENV RAILS_ENV=docker
COPY . .

EXPOSE 3000
CMD ["entrypoint.sh"]


