FROM ruby:2.4.1

ENV APP_HOME /home/app
ENV BUNDLE_PATH /bundle

WORKDIR $APP_HOME

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install
ADD . $APP_HOME

EXPOSE 3000