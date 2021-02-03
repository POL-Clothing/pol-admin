FROM ruby:<%= RUBY_VERSION %>

MAINTAINER Aaron Smulktis <aaron@instinct.is>

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /dna
COPY Gemfile /dna/Gemfile
COPY Gemfile.lock /dna/Gemfile.lock
RUN bundle install
COPY . /dna

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# CMD ["./your-daemon-or-script.rb"]