FROM ruby:2.6.2
# FROM ruby:2.6.2-alpine

LABEL maintainer="Aaron Smulktis <aaron@instinct.is>"

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1

RUN echo "CURRENT DIRECTORY: $PWD"

# RUN addgroup -S dna_users && adduser -S -G dna_users dna_admin
RUN groupadd dna_users && useradd -G dna_users dna_admin

# ADD gemrc /root/.gemrc
# WORKDIR /home/dna_admin

# Debian?
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# Alpine?
# RUN apk update && apk add nodejs postgresql-client
# RUN apk --update add build-base nodejs tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick
# RUN apk update \
# && apk add ruby \
#            ruby-etc \
#            ruby-bigdecimal \
#            ruby-io-console \
#            ruby-irb \
#            ca-certificates \
#            libressl \
#            less \
# && apk add --virtual .build-dependencies \
#            build-base \
#            ruby-dev \
#            libressl-dev \
# && gem install --no-rdoc --no-ri bundler:'~> 2.0' \
#                                  json \
# && bundle config build.nokogiri --use-system-libraries \
# && bundle config git.allow_insecure true \
# \
# && gem cleanup \
# && apk del .build-dependencies \
# && rm -rf /usr/lib/ruby/gems/*/cache/* \
#           /var/cache/apk/* \
#           /tmp/* \
#           /var/tmp/*

# Set an environment variable to store where the app is installed inside
# of the Docker image.
ENV INSTALL_PATH /dna/admin_app
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

RUN gem update --system

# RUN gem install bundler
RUN gem uninstall bundler
RUN gem install bundler --version '1.0.0'

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN echo "CURRENT DIRECTORY: $PWD"
COPY --chown=dna_admin:dna_users Gemfile $INSTALL_PATH/Gemfile
COPY --chown=dna_admin:dna_users Gemfile.lock $INSTALL_PATH/Gemfile.lock

# Set RAILS_ENV and RACK_ENV
ARG RAILS_ENV
ENV RACK_ENV=$RAILS_ENV

RUN echo "CURRENT DIRECTORY: $PWD"
RUN bundle install

# Finish establishing our Ruby environment depending on the RAILS_ENV
# RUN if [[ "$RAILS_ENV" == "production" ]]; then bundle install --without development test; else bundle install; fi

COPY --chown=dna_admin:dna_users . $INSTALL_PATH
RUN echo "CURRENT DIRECTORY: $PWD"
# Add a script to be executed every time the container starts.
COPY ./docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# CMD ["./your-daemon-or-script.rb"]