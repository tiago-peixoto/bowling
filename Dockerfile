FROM ruby:2.6.5-alpine

WORKDIR /usr/src/bowling

RUN apk update && apk upgrade && apk add --no-cache build-base postgresql-dev libpq tzdata

COPY . .

RUN bundle install

CMD ["rails", "s"]