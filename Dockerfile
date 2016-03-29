FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential

ADD . /site-generator
WORKDIR /site-generator
ADD Gemfile /site-generator/Gemfile
ADD Gemfile.lock /site-generator/Gemfile.lock
RUN bundle install
