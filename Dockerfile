FROM ruby:2.7.6

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN bundle install --local

ENTRYPOINT [ "ruby", "main.rb" ]