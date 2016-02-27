FROM ruby:2.2.3
ADD . .
RUN apt-get update -qq \
	&& apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /timeliner
WORKDIR /timeliner
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
