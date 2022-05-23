# syntax = docker/dockerfile:experimental
FROM nixos/nix as base

RUN nix-channel --update

ARG BUNDLER_VERSION=2.3.9

ARG RAILS_ENV=production
ENV RAILS_ENV=${RAILS_ENV}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

ARG BUNDLE_WITHOUT=development:test
ARG BUNDLE_PATH=vendor/bundle
ENV BUNDLE_PATH ${BUNDLE_PATH}
ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}
ENV BUNDLE_FORCE_RUBY_PLATFORM false

RUN mkdir /app
WORKDIR /app
RUN mkdir -p tmp/pids

ENV BASH_ENV ~/.bashrc
COPY default.nix ./
RUN nix-build
RUN rm /usr/share
RUN mkdir -p /usr/share
RUN nix-shell --command 'ln -s $TZDIR /usr/share/zoneinfo'

FROM base as build_deps
WORKDIR /app

COPY Gemfile* ./
RUN nix-shell --command "bundle install &&  rm -rf vendor/bundle/ruby/*/cache"

ENV SECRET_KEY_BASE 1

COPY . .

RUN nix-shell --command "bundle exec rails assets:precompile"

ENV PORT 8080

ARG SERVER_COMMAND="bundle exec puma -C config/puma.rb"
ENV SERVER_COMMAND ${SERVER_COMMAND}
CMD nix-shell --command '${SERVER_COMMAND}'
