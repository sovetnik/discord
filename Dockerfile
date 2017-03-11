# Dockerfiles work by receiving the below instructions:
#
# clean images
# docker rmi $(docker images -f "dangling=true" -q)

FROM ruby:2.3-slim
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev postgresql-client

ENV INSTALL_PATH /discord

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install --binstubs

COPY . .

RUN rails assets:precompile

CMD puma -C config/puma.rb
