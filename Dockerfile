#
# If using Dockerfile alone, make sure that you have a postgres DB
# up and running, using the `pgdb` name and that the container is
# on the same network as this container.
#

FROM ruby:2.6-buster
LABEL maintainer="Andy Duss <mindovermiles262@gmail.com>"

# Install yarn and NodeJS
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y \
    nodejs \
    yarn

WORKDIR /rails

# Install Gems
COPY bin bin
COPY Gemfile* ./
RUN bin/bundle install

# Install Node Packages
COPY package.json yarn.lock ./
RUN yarn

COPY . .

EXPOSE 3000
CMD ["/rails/entrypoint.sh"]
