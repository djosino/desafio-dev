# Start from a small, trusted base image with the version pinned down
FROM ruby:3.1.2 as base

ENV BUNDLER_VERSION=2.3.7

RUN apt-get update -qq
RUN apt-get install -y \
      curl \
      g++ \
      gcc \
      git \
      nodejs \
      postgresql-client \
      tzdata \
      redis \
      yarn

RUN gem install bundler -v 2.3.7

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install
RUN bundle check

# We'll install the app in this directory
WORKDIR /home/app

COPY . ./

# Install assets
RUN RAILS_ENV=production SECRET_KEY_BASE=assets bundle exec rake assets:precompile

# Launch the server
CMD ["bundle", "exec", "rackup"]

ENTRYPOINT ["./.dockerfiles/docker-entrypoint.sh"]
