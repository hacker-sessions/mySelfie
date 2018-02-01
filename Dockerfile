FROM ruby:2.4.1

# Set install path
ENV INSTALL_PATH /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs

# Install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Fix: 'Cannot find module 'node-sass'
RUN yarn add node-sass

# Create the main directory
RUN mkdir $INSTALL_PATH

# Set the main directory to INSTALL_PATH
WORKDIR $INSTALL_PATH

# Install gems
ADD Gemfile $INSTALL_PATH/Gemfile
ADD Gemfile.lock $INSTALL_PATH/Gemfile.lock
RUN bundle install

# Install foreman
RUN gem install foreman

# Copy the code to the container
COPY . .