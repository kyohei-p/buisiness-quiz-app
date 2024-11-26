FROM ruby:3.2.6

WORKDIR /buisiness-quiz-app

RUN apt-get update -qq && \
    apt-get install -y build-essential default-libmysqlclient-dev

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /buisiness-quiz-app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
