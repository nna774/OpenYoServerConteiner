FROM ubuntu:14.04
MAINTAINER yo@nna774.net

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq upgrade
RUN apt-get install -y ruby ruby-dev git build-essential libmysqlclient-dev
RUN gem install bundler
RUN git clone https://github.com/nna774/OpenYo.git
RUN cd OpenYo/; bundle install --path=vendor/bundle
ADD config.rb /OpenYo/

EXPOSE 9292
CMD cd OpenYo/; bundle exec rackup
