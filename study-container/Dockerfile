FROM ruby:3.3-alpine
WORKDIR /app
RUN apk add --no-cache build-base
COPY Gemfile ./
RUN bundle install
COPY . ./
EXPOSE 3000
CMD ["bundle", "exec", "rackup", "config.ru", "-o", "0.0.0.0", "-p", "3000"]
