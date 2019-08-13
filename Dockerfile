FROM ruby:2.6.3-alpine3.9

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN set -ex && \
  apk update && \
  apk add --no-cache libstdc++ postgresql-dev tzdata build-base bash nodejs npm yarn && \
  bundle install --no-cache && \
  apk del build-base
RUN gem install bundle
RUN yarn install --check-files
EXPOSE 3000
