FROM ruby:2.1.5

# Ensure everything is up to date
RUN apt-get update -qq

# Install the postgres client
RUN apt-get install -y postgresql-client

# Install netcat so we can wait for mysql
RUN apt-get install -y netcat

# Install node.js (javascript runtime for Ruby)
RUN apt-get install -y curl && \
     curl -sL https://deb.nodesource.com/setup | bash - && \
     apt-get install -y nodejs

# Install phantom.js
RUN cd /tmp && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 && \
     tar xjf /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /tmp && \
     mv /tmp/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin

# Run the bundle install as part of the docker image so the dependencies are
# cached.
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install -j8

ADD . /app
WORKDIR /app
